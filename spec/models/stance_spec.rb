require 'spec_helper'

describe Stance do
	it { FactoryGirl.build(:stance).should be_valid }
	it { FactoryGirl.build(:stance, :participant_id => nil).should_not be_valid }
end
