require 'spec_helper'

describe DashboardController do
  before(:each) do
    sign_in
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'participants'" do
    it "returns http success" do
      get 'participants', :format => :csv
      response.should be_success
    end
  end

  describe "GET 'rankings'" do
    it "returns http success" do
      get 'rankings', :format => :csv
      response.should be_success
    end
  end

  describe "GET 'sources'" do
    it "returns http success" do
      get 'sources', :format => :csv
      response.should be_success
    end
  end

  describe "GET 'stances'" do
    it "returns http success" do
      get 'stances', :format => :csv
      response.should be_success
    end
  end

end
