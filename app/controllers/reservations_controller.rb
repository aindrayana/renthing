class ReservationsController < ApplicationController
  before_action :authenticate_user

  def show
    # render text:current_user.id
    # @item = Item.find params[:item_id]
  end

  def index
    # render text:params
    @res = Reservation.where("user_id='#{current_user.id}'")
    # @item = Item.joins(:reservations).where(reservations: {user_id:"#{current_user.id}"})
    # render text:@item.count
  end

  def create
    # render text:params
    # - update reservation table ---------------------------------------------------------------------------
    reservation_params = params.require(:reservation).permit(:date_start, :date_end, :rent_term, :rent_fee)
    @item = Item.find params[:item_id]
    @reservation = current_user.reservations.new(reservation_params)
    @reservation.item = @item

    respond_to do |format|
      if @reservation.save
        if @item.reserve
          @item.save
        end

        # ReservationMailer.notify_item_owner(@reservation).deliver_later

        format.html { redirect_to listing_path(@item), notice: "Item successfully reserved" }
        format.js { render :create_success }
      else
        flash[:alert] = @reservation.errors.full_messages.join(", ")
        render "listings/show"

        # format.html { render "listings/show" }
        # format.js { render :create_failure }
        # format.js { render js: "alert('failed');" }
      end
    end
    # - end update reservation table ------------------------------------------------------------------------
  end

  def approve
    # render text:params
    item = Item.find params[:item_id]
    if item.approve
      item.save
      redirect_to item, notice: "Item Approved!"
    else
      redirect_to item, alert: "Error! Can't approve item"
    end
  end

  def cancel
    # render text:params
    item = Item.find params[:item_id]
    if item.cancel
      item.save
      redirect_to item, notice: "Item set to Cancelled!"
    else
      redirect_to item, alert: "Error! Can't cancel item"
    end
  end

  def return
    # render text:params
    item = Item.find params[:item_id]
    if item.return
      item.save
      redirect_to item, notice: "Item Retured!"
    else
      redirect_to item, alert: "Error! Can't return item"
    end
  end

end
