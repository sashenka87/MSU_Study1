require 'spec_helper'

describe PagesController do
  render_views

  let(:session_id) { "woo" }

  def valid_session
    { :session_id => session_id }
  end

  describe "GET 'welcome'" do
    it "returns http success" do
      get 'welcome'
      response.should be_success
    end
  end

  describe "GET 'goodbye'" do
    it "returns http success" do
      get 'goodbye'
      response.should be_success
    end
  end
  
  describe "GET 'directions'" do
    before(:each) do
      @participant = FactoryGirl.create(:participant, :session_id => session_id)
    end

    it "returns http success" do
      get 'directions', {}, valid_session
      response.should be_success
    end
  end

  describe "GET 'library'" do
    before(:each) do
      @participant = FactoryGirl.create(:participant, :session_id => session_id)
    end

    it "returns http success" do
      get 'library', {}, valid_session
      response.should be_success
    end
  end

  describe "GET 'ranking'" do
    before(:each) do
      @participant = FactoryGirl.create(:participant, :session_id => session_id)
      @stance = FactoryGirl.create(:stance, :participant => @participant)
    end 

    it "redirects to goodbye" do
      get 'ranking', {}, valid_session
      response.should redirect_to(:action => :goodbye)
    end

    it "returns http success" do
      source = FactoryGirl.create(:source, :stance => @stance, :source_name => "blog")
      get 'ranking', {}, valid_session
      response.should be_success
    end
  end
end
