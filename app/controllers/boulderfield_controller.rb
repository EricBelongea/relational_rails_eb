class BoulderfieldController < ApplicationController
  def index 
    @field = Field.find(params[:id])
    @boulders = @field.boulders
  end

  def new

  end

  def create 
    require 'pry'; binding.pry
    # @fields = Field.find(
    #   params[:id]
    # )
    
    # field.boulders.create
    boulder = Boulder.new({
      name: params[:boulder][:name],
      v_grade: params[:boulder][:v_grade],
      tick: params[:boulder][:tick]
    })

    boulder.save

    redirect_to "/fields/:id/boulders"
  end
end