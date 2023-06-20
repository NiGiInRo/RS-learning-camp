class TargetsController < ApplicationController
  before_action :set_target, only: %i[ show update destroy ]
  before_action :authenticate_user!

  def index
    @target = current_user.targets
    render json: @target
  end

  def show
    render json: @target
  end

  def create
    @target = Target.new(target_params)
    @target.user_id = current_user.id

    if current_user.targets.count >= 3
      render json: { message: "3 targets max per user"}, status: :unauthorized
    else
      if @target.save
        render json: @target, status: :created
      else
        render json: @target.errors, status: :unprocessable_entity
      end
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
      params.require(:target).permit(:topic_id, :title, :radius, :lat, :lng, :user_id)
    end
end
