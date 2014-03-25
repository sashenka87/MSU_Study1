# == Schema Information
# Schema version: 20140320051046
#
# Table name: stances
#
#  id             :integer          not null, primary key
#  participant_id :integer
#  supporting     :integer
#  created_at     :datetime
#  updated_at     :datetime
#  statement      :text
#
# Indexes
#
#  index_stances_on_participant_id  (participant_id)
#

class Stance < ActiveRecord::Base
	validates_presence_of :participant_id

	belongs_to :participant, :class_name => "Participant", :foreign_key => "participant_id"
	has_many :sources, :class_name => "Source", :foreign_key => "stance_id", :dependent => :destroy
	has_many :rankings, :class_name => "Ranking", :foreign_key => "stance_id", :dependent => :destroy

	accepts_nested_attributes_for :sources
	accepts_nested_attributes_for :rankings
end
