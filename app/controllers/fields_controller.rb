class FieldsController < ApplicationController
  def index
    @fields = Field.all.order(created_at: :asc)
  end

  def show
    @field = Field.find(params[:id])
    
  end
end