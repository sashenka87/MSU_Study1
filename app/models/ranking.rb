# == Schema Information
# Schema version: 20140319184355
#
# Table name: rankings
#
#  id                        :integer          not null, primary key
#  stance_id                 :integer
#  source_name               :string(255)
#  category                  :integer
#  useful_ranking            :integer
#  useful_justification      :string(255)
#  trustworthy_ranking       :integer
#  trustworthy_justification :string(255)
#  accurate_ranking          :integer
#  accurate_justification    :string(255)
#  interesting_ranking       :integer
#  interesting_justification :string(255)
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
