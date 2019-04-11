class StancesController < ApplicationController
  before_action :authenticate_admin, except: [:create, :update]
  before_action :set_stance, only: [:show, :edit, :update, :destroy]

  # GET /stances
  # GET /stances.json
  def index
    @stances = Stance.all
  end

  # GET /stances/1
  # GET /stances/1.json
  def show
  end

  # GET /stances/new
  def new
    @stance = Stance.new
  end

  # GET /stances/1/edit
  def edit
  end

  # POST /stances
  # POST /stances.json
  def create
    @stance = Stance.new(stance_params)
    @stance.participant = Participant.find_by(:session_id => session[:session_id])

    respond_to do |format|
      if @stance.save
        format.html { redirect_to goodbye_path }
        format.json { render action: 'show', status: :created, location: @stance }
      else
        format.html { render action: 'new' }
        format.json { render json: @stance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stances/1
  # PATCH/PUT /stances/1.json
  def update
    respond_to do |format|
      if @stance.update(stance_params)
        format.html { redirect_to goodbye_path }
        format.json { render action: 'show', status: :ok, location: @stance }
      else
        format.html { render action: 'edit' }
        format.json { render json: @stance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stances/1
  # DELETE /stances/1.json
  def destroy
    @stance.destroy
    respond_to do |format|
      format.html { redirect_to stances_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stance
      @stance = Stance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stance_params
      params.require(:stance).permit(:supporting, :statement, :source_order,
        :sources_attributes => [
          :order, :time_duration, :trustworthy, :useful, :accurate, :interesting, :source_name, :depth,
          :pre_reason, :pre_reason_other_text, :like_text, :sentiment, :post_reason, :post_reason_other_text
        ],
        :rankings_attributes => [:source_name, :useful_ranking, :useful_justification,
          :trustworthy_ranking, :trustworthy_justification, :accurate_ranking, :accurate_justification,
          :interesting_ranking, :interesting_justification])
    end
end
