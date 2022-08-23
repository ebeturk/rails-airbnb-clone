class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @dragon = Dragon.find(params[:dragon_id])
    @booking.dragon = @dragon
    @booking.save
    redirect_to dragon_path(@dragon)
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    # redirect_to dragons_path
    redirect_to dragon_path(@booking.dragon), status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :user_id, :dragon_id)
  end
end
