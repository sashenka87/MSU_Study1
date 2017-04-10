class PagesController < ApplicationController
  before_action :get_participant
  before_action :no_participant, :except => [:welcome, :goodbye]

  def welcome
    @title = "Welcome"
    if @participant
      redirect_to :action => :directions
    else
      render layout: "cover"
    end
  end

  def goodbye
    reset_session()
  	@title = "Goodbye"
  	render layout: "cover"
  end

  def directions
    @title = "Directions"
    if session[:directions]
      redirect_to :action => :library
    else
      session[:directions] = true
    end
  end

  def library
    @title = "Library"
    @sources = source_names.shuffle

    @stance = Stance.new

    if @participant.stance
      redirect_to :action => :ranking
    end
  end

  def ranking
    @title = "Ranking"
    @stance = @participant.stance

    used = @stance.sources.group(:source_name).pluck(:source_name)

    @sources_used = source_names.select { |i| used.include?(i[1])}

    redirect_to :action => :goodbye if @sources_used.empty?
  end

  private

  def get_participant
    @participant = Participant.find_by(:session_id => session[:session_id])
  end

  def no_participant
    redirect_to new_participant_path if @participant.nil?
  end

  def source_names
    [
      ["UBI is a Right", "blog"],
      ["UBI Will End Poverty", "essay"],
      ["UBI Takes From the Poor", "wikipedia"],
      ["UBI Saves the Future for Work", "newspaper"],
      ["No UBI, Humans Need to Work", "public_opinion"],
      ["UBI is Unaffordable", "tweets"]
    ]
  end
end
