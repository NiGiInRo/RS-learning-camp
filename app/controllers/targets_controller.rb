class TargetsController < ApplicationController
  before_action :set_target, only: %i[ show update destroy ]

  def index
    @targets = Target.all

    render json: @targets
  end

  def show
    render json: @target
  end

  def create
    @target = Target.new(target_params)

    if @target.save
      render json: @target, status: :created
    else
      render json: @target.errors, status: :unprocessable_entity
    end
  end

  def update
    if @target.update(target_params)
      render json: @target
    else
      render json: @target.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @target.destroy
  end

  private
    def set_target
      @target = Target.find(params[:id])
    end

    def target_params
      params.require(:target).permit(:topic_id, :title, :radius, :lat, :lng)
    end
end
