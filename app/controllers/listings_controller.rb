class ListingsController < ApplicationController
  before_action :set_item, only: [:show]

  def index
    search_params = params.permit([:search])
    @search = search_params[:search]
    @items = Item.where(["title ilike ? OR description ilike ?",
        "%#{@search}%",
        "%#{@search}%"]).where("aasm_state='available'").order("created_at DESC")
  end

  def show
    @reservation = Reservation.new
  end

  private
    def set_item
      @item = Item.find(params[:id])
    end

end
