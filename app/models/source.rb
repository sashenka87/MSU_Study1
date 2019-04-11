# == Schema Information
# Schema version: 20140320051046
#
# Table name: sources
#
#  id            :integer          not null, primary key
#  stance_id     :integer
#  order         :integer
#  time_duration :integer
#  trustworthy   :integer
#  useful        :integer
#  accurate      :integer
#  interesting   :integer
#  created_at    :datetime
#  updated_at    :datetime
#  source_name   :string
#  depth         :integer          default(0)
#
# Indexes
#
#  index_sources_on_stance_id  (stance_id)
#

class Source < ActiveRecord::Base
	belongs_to :stance, :class_name => "Stance", :foreign_key => "stance_id"
end
