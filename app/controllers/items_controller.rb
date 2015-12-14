class ItemsController < ApplicationController
  before_action :authenticate_user
  before_action :set_item, only: [:show, :edit, :update, :destroy]


  def index
    # @items = Item.all
    @items = Item.where("user_id = #{current_user.id}" )
  end

  def show
  end

  def new
    @item = Item.new
    @images = @item.images.build
  end

  def edit
  end

  def create
    # @item = Item.last
    @item = Item.new(item_params)
    @item.user = current_user
    respond_to do |format|
      if @item.save

        params[:images]['file_name'].each do |img|
          @image = @item.images.create(file_name: img)
          @image.save
          # puts "file_image_name: #{img}"
         end

        # render text: params[:images]['file_name']

        format.html { redirect_to items_path, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @item.update(item_params)

        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:title, :description, :hourly_rate, :daily_rate,
                                  :weekly_rate, :monthly_rate, :isavailable,
                                  :ispublish, :user_id, :category_id,
                                  images_attributes:[:file_name, :item_id, :id])
    end
end
