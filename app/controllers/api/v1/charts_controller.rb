class Api::V1::ChartsController < ApplicationController
  before_action :find_chart, only: [:update, :show, :destroy]

  def index
    @charts = Chart.all
    render json: @charts
  end

  def show
    render json: @chart
  end

  def create
    @chart = Chart.create(chart_params)
    if @chart.save
      render json: @chart, status: :accepted
    else
      render json: { errors: @chart.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    @chart.destroy
  end

  private

  def chart_params
    params.permit(:user_id, :balance, :date_time)
  end

  def find_chart
    @chart = Chart.find(params[:id])
  end

end
