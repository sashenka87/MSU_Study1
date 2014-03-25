require 'spec_helper'

describe Ranking do
	it { FactoryGirl.build(:ranking).should be_valid }
end
