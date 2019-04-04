class Api::V1::BandsController < Api::V1::BaseController
  before_action :set_band, only: [:show]

  def index
    @bands = Band.all
  end

  def show
    @related_bands = @band.find_related_tags
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

  def tagged
    if params[:tag].present?
      @bands = Band.tagged_with(params[:tag])
    else
      @bands = Band.all
    end
  end

  private

  def set_band
    @band = Band.find(params[:id])
  end

  def band_params
    params.require(:band).permit(:name, :photo, :location, :price, :description, :link, :style, tag_list: [])
  end

  def render_error
    render json: { errors: @band.errors.full_messages },
      status: :unprocessable_entity
  end
end
