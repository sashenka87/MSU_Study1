class ParticipantsController < ApplicationController
  before_action :authenticate_admin, except: [:new, :create]
  before_action :set_participant, only: [:show, :destroy]

  # GET /participants
  # GET /participants.json
  def index
    @participants = Participant.all

    respond_to do |format|
      format.html
      format.json
      format.csv {
        csv_string = CSV.generate do |csv|
          csv << ["id","ip_address", "first_name", "last_name", "email", "instructor", "session_id", "created_at", "updated_at"]
          @participants.each do |p|
            csv << [p.id, p.ip_address, p.first_name, p.last_name, p.email, p.instructor, p.session_id, p.created_at, p.updated_at]
          end
        end

        send_data csv_string, :type => 'text/csv; charset=iso-8859-1; header=present',
                              :disposition => "attachment; filename=participants.csv"
      }
    end
  end

  # GET /participants/1
  # GET /participants/1.json
  def show
  end

  # GET /participants/new
  def new
    @participant = Participant.new
  end

  # POST /participants
  # POST /participants.json
  def create
    @participant = Participant.new(participant_params)
    @participant.session_id = session[:session_id]
    @participant.ip_address = request.ip

    respond_to do |format|
      if @participant.save
        format.html { redirect_to directions_path }
        format.json { render action: 'show', status: :created, location: @participant }
      else
        format.html { render action: 'new' }
        format.json { render json: @participant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /participants/1
  # DELETE /participants/1.json
  def destroy
    @participant.destroy
    respond_to do |format|
      format.html { redirect_to participants_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_participant
      @participant = Participant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def participant_params
      params.require(:participant).permit(:first_name, :last_name, :instructor, :email)
    end
end
