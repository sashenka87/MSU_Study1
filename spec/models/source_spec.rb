require 'spec_helper'

describe Source do
	it { FactoryGirl.build(:source).should be_valid }
end
