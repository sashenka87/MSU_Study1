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
      redirect_to :action => :task_analysis
    else
      session[:directions] = true
    end
  end

  def task_analysis
    @title = "Task Analysis"

    unless @participant.task_analysis.blank?
      redirect_to :action => :library
    end
  end

  def update_task_analysis
    @participant.task_analysis = params[:task_analysis]
    @participant.save

    redirect_to :action => :library
  end

  def library
    @title = "Library"
    @sources = source_names.shuffle

    @stance = Stance.new(source_order: @sources.map { |s| s[1] }.join(","))

    if @participant.stance
      redirect_to :action => :goodbye
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
      ["Prostitution is Female Oppression", "blog"],
      ["Prostitution is Violent, Trust Me", "essay"],
      ["Prostitution Increases Trafficking", "newspaper"],
      ["Sex Work is a Civil Right", "public_opinion"],
      ["Sex Work Improves Public Health", "tweets"],
      ["Sex Workers Have a Right to Labor", "wikipedia"],
      ["Source 7", "source7"],
      ["Source 8", "source8"],
      ["Source 9", "source9"],
      ["Source 10", "source10"],
      ["Source 11", "source11"],
      ["Source 12", "source12"]
    ]
  end
end
