require 'csv'

class DashboardController < ApplicationController
  before_action :authenticate_admin

  def index
    @title = "Dashboard"
    @participant_count = Participant.count
    @ranking_count = Ranking.count
    @source_count = Source.count
    @stance_count = Stance.count
  end

  def participants
    @participants = Participant.all

    respond_to do |format|
      format.csv {
        csv_string = CSV.generate do |csv|
          csv << ["id", "session_id", "ip_address", "first_name", "last_name", "instructor", "email",
            "created_at", "updated_at", "task_analysis"]
          @participants.each do |p|
            csv << [p.id, p.session_id, p.ip_address, p.first_name, p.last_name, p.instructor, p.email,
             p.created_at, p.updated_at, p.task_analysis]
          end
        end

        send_data csv_string, :type => 'text/csv; charset=iso-8859-1; header=present',
                              :disposition => "attachment; filename=participants.csv"
      }
    end
  end

  def rankings
    @rankings = Ranking.all

    respond_to do |format|
      format.csv {
        csv_string = CSV.generate do |csv|
          csv << ["id", "stance_id", "source_name", "category", "useful_ranking", "useful_justification",
            "trustworthy_ranking", "trustworthy_justification", "accurate_ranking", "accurate_justification",
            "interesting_ranking", "interesting_justification", "created_at", "updated_at"]
          @rankings.each do |r|
            csv << [r.id, r.stance_id, r.source_name, r.category, r.useful_ranking, r.useful_justification,
              r.trustworthy_ranking, r.trustworthy_justification, r.accurate_ranking, r.accurate_justification,
              r.interesting_ranking, r.interesting_justification, r.created_at, r.updated_at]
          end
        end

        send_data csv_string, :type => 'text/csv; charset=iso-8859-1; header=present',
                              :disposition => "attachment; filename=rankings.csv"
      }
    end
  end

  def sources
    @sources = Source.all

    respond_to do |format|
      format.csv {
        csv_string = CSV.generate do |csv|
          csv << ["id", "stance_id", "order", "time_duration", "trustworthy", "useful", "accurate", "interesting",
            "created_at", "updated_at", "source_name", "depth",
            "pre_reason", "pre_reason_other_text", "like_text", "sentiment",
            "post_reason", "post_reason_other_text"
          ]
          @sources.each do |s|
            csv << [s.id, s.stance_id, s.order, s.time_duration, s.trustworthy, s.useful, s.accurate, s.interesting,
              s.created_at, s.updated_at, s.source_name, s.depth,
              s.pre_reason, s.pre_reason_other_text, s.like_text, s.sentiment,
              s.post_reason, s.post_reason_other_text
            ]
          end
        end

        send_data csv_string, :type => 'text/csv; charset=iso-8859-1; header=present',
                              :disposition => "attachment; filename=sources.csv"
      }
    end
  end

  def stances
    @stances = Stance.all

    respond_to do |format|
      format.csv {
        csv_string = CSV.generate do |csv|
          csv << ["id", "participant_id", "supporting", "created_at", "updated_at", "statement", "source_order"]
          @stances.each do |s|
            csv << [s.id, s.participant_id, s.supporting, s.created_at, s.updated_at, s.statement, s.source_order]
          end
        end

        send_data csv_string, :type => 'text/csv; charset=iso-8859-1; header=present',
                              :disposition => "attachment; filename=stances.csv"
      }
    end
  end
end
