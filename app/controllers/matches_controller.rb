class MatchesController < ApplicationController
  before_action :set_match, only: %i[ show edit update destroy ]

  # GET /matches
  def index
    @matches = Match.all
  end

  # GET /matches/1
  def show
  end

  # GET /matches/new
  def new
    @match = Match.new
  end

  # GET /matches/1/edit
  def edit
  end

  # POST /matches
  def create
    @match = Match.new(match_params)

    if @match.save
      redirect_to @match, notice: "Match was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /matches/1
  def update
    if @match.update(match_params)
      redirect_to @match, notice: "Match was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /matches/1
  def destroy
    @match.destroy
    redirect_to matches_url, notice: "Match was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_match
      @match = Match.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def match_params
      params.require(:match).permit(:first_user_id, :second_user_id, :target_id)
    end
end
