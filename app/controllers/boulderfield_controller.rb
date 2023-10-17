class BoulderfieldController < ApplicationController
  def index 
    @field = Field.find(params[:id])
    @boulders = @field.boulders
  end

  def new
    @field = Field.find(params[:id])
  end

  def create 
    @field = Field.find(params[:id])
    
    @field.boulders.create({
      name: params[:boulder][:name],
      v_grade: params[:boulder][:v_grade],
      tick: params[:boulder][:tick]
    })

    redirect_to "/fields/#{@field.id}/boulders"
  end
end