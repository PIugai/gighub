class Api::V1::BookingsController < Api::V1::BaseController
  def index
    @user = User.find(params[:user_id])
    @bookings = @user.bookings
  end
end
