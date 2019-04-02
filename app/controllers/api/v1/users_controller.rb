class Api::V1::UsersController < Api::V1::BaseController
  before_action :set_user, only: [:show]

  def show
  end

  def new

  end

  def create
    @band = Restaurant.new(restaurant_params)
    if @restaurant.save
      render :show, status: :created
    else
      render_error
    end

  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
