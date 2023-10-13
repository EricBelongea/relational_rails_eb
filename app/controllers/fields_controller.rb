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
      field_name: params[:fields][:field_name],
      in_season: params[:fields][:in_season],
      total_ticks: params[:fields][:total_ticks]
    })

    field.save

    redirect_to "/fields"
  end
end