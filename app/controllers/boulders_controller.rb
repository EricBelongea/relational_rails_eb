class BouldersController < ApplicationController
  def index
    @boulders = Boulder.all
  end

  def show
    @boulder = Boulder.find(params[:id])
  end
end