# == Schema Information
# Schema version: 20140318012953
#
# Table name: participants
#
#  id         :integer          not null, primary key
#  session_id :string(255)
#  ip_address :string(255)
#  first_name :string(255)
#  last_name  :string(255)
#  instructor :string(255)
#  email      :string(255)
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
