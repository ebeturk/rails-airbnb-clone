class BookingsController < ApplicationController

  def new
    @dragon = Dragon.find(params[:dragon_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @dragon = Dragon.find(params[:dragon_id])
    @booking.user = current_user
    @booking.dragon = @dragon
    if @booking.save
      redirect_to dragon_path(@dragon), notice: "The beast is all yours!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def dashboard
    @bookings = Booking.where(user_id: current_user.id)
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to dragon_path(@booking.dragon), notice: "Booking was successfully cancelled.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :dragon_id)
  end

end
