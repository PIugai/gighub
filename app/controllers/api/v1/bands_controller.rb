class Api::V1::BandsController < Api::V1::BaseController
  before_action :set_band, only: [:show]

  def index
    @bands = Band.all
  end

  def show
  end

  private

  def set_band
    @band = Band.find(params[:id])
  end
end
