require 'spec_helper'

describe Participant do
	it { FactoryGirl.build(:participant).should be_valid }
	it { FactoryGirl.build(:participant, :first_name => nil).should_not be_valid }
	it { FactoryGirl.build(:participant, :last_name => nil).should_not be_valid }
	it { FactoryGirl.build(:participant, :instructor => nil).should_not be_valid }
	it { FactoryGirl.build(:participant, :email => nil).should_not be_valid }
end
