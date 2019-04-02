class Api::V1::BandsController < Api::V1::BaseController
  before_action :set_band, only: [:show]

  def index
    @bands = Band.all
  end

  def show
  end

  def new
    @user = User.find(params[:user_id])
    @band = Band.new
  end

  def create
    @band = Band.new(band_params)
    @band.user = User.find(params[:user_id])
    if @band.save
      render :show, status: :created
    else
      render_error
    end
  end

  private

  def set_band
    @band = Band.find(params[:id])
  end

  def band_params
    params.require(:band).permit(:name, :photo, :location, :price, :description, :link)
  end

  def render_error
    render json: { errors: @band.errors.full_messages },
      status: :unprocessable_entity
  end
end
