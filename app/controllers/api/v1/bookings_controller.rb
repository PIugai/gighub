class Api::V1::BookingsController < Api::V1::BaseController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      status: :created
    elese
      render_error
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :user_id, :band_id)
  end

  def render_error
    render json: { errors: @booking.errors.full_messages },
      status: :unprocessable_entity
  end
end
