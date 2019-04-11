# == Schema Information
# Schema version: 20140320051046
#
# Table name: participants
#
#  id         :integer          not null, primary key
#  session_id :string
#  ip_address :string
#  first_name :string
#  last_name  :string
#  instructor :string
#  email      :string
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_participants_on_session_id  (session_id)
#

class Participant < ActiveRecord::Base
  validates_presence_of :session_id
  validates_presence_of :ip_address
  
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :instructor
  validates_presence_of :email

  has_one :stance, :dependent => :destroy
end
