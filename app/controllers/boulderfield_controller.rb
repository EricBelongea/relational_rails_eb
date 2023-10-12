class BoulderfieldController < ApplicationController
  def index 
    @field = Field.find(params[:id])
    @boulders = @field.boulders
  end
end