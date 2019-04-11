# == Schema Information
# Schema version: 20140320051046
#
# Table name: rankings
#
#  id                        :integer          not null, primary key
#  stance_id                 :integer
#  source_name               :string
#  category                  :integer
#  useful_ranking            :integer
#  useful_justification      :string
#  trustworthy_ranking       :integer
#  trustworthy_justification :string
#  accurate_ranking          :integer
#  accurate_justification    :string
#  interesting_ranking       :integer
#  interesting_justification :string
#  created_at                :datetime
#  updated_at                :datetime
#
# Indexes
#
#  index_rankings_on_stance_id  (stance_id)
#

class Ranking < ActiveRecord::Base
	belongs_to :stance, :class_name => "Stance", :foreign_key => "stance_id"
end
