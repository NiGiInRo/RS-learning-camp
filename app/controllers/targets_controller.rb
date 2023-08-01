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

    if @target.save
      TargetService.call(@target) #Crea en la tabla Matches los registros necesarios, si encuenta targets en comun. 
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
=begin
    def check_for_matches(target)
      matching_targets = Target.where(topic_id: target.topic_id)
      #TODO
      #-GEMA GEOKIT COMO CONFUGURARLA
      #-card 6, se abre una conversacion cuando 2 usuarios hacen match!
      matching_targets.each do |matching_target|
        if matching_target != target
          Match.create(
            first_user_id: target.user_id,
            second_user_id: matching_target.user_id,
            target_id: target.id
          )
        end
      end
    end
=end
    def set_target
      @target = Target.find(params[:id])
    end

    def target_params
      params.require(:target).permit(:topic_id, :title, :radius, :lat, :lng, :user_id)
    end
end
