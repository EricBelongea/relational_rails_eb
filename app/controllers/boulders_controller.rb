class BouldersController < ApplicationController
  def index
    @boulders = Boulder.all
  end
end