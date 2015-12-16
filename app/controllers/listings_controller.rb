class ListingsController < ApplicationController
  before_action :set_item, only: [:show]

  def index
    search_params = params.permit([:search])
    @search = search_params[:search]
    @items = Item.where(["title ilike ? OR description ilike ?", "%#{@search}%", "%#{@search}%"]).order("created_at DESC")
    # render text: "search: #{@search} <br>path: #{request.env['PATH_INFO']}"
    # render text: "search: #{@search}"
  end

  private
    def set_item
      @item = Item.find(params[:id])
    end

end
