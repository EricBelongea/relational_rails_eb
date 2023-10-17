class FieldsController < ApplicationController
  def index
    @fields = Field.all.order(created_at: :asc)
  end

  def show
    @field = Field.find(params[:id])
  end

  def new

  end

  def create
    field = Field.new({
      field_name: params[:field][:field_name],
      in_season: params[:field][:in_season],
      total_ticks: params[:field][:total_ticks]
    })

    field.save

    redirect_to "/fields"
  end

  def edit
    @field = Field.find(params[:id])
  end
  
  def update
    field = Field.find(params[:id])
    field.update({
      field_name: params[:field][:field_name],
      in_season: params[:field][:in_season],
      total_ticks: params[:field][:total_ticks]
    })

    field.save

    redirect_to "/fields/#{field.id}"
  end

  def destroy
    Field.find(params[:id]).destroy

    redirect_to "/fields"
  end
end