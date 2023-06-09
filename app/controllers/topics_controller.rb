class TopicsController < ApplicationController
  before_action :set_topic, only: %i[ show update destroy ]
  before_action :authenticate_user!

  def index
    @topics = Topic.all

    render json: @topics
  end

  def show
    render json: @topic
  end

  def create
    @topic = Topic.new(topic_params)

    if @topic.save
      render json: @topic, status: :created
    else
      render json: @topic.errors, status: :unprocessable_entity
    end
  end

  def update
    if @topic.update(topic_params)
      render json: @topic
    else
      render json: @topic.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @topic.destroy
  end

  private
    def set_topic
      @topic = Topic.find(params[:id])
    end

    def topic_params
      params.require(:topic).permit(:name, :image)
    end
end
