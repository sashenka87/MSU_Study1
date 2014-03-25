require 'spec_helper'

describe ApplicationHelper do
  describe "title_helper" do
    it "should return 'DRLRL MSU'" do
      @title = nil
      helper.title.should == "DRLRL MSU"
      @title = ""
      helper.title.should == "DRLRL MSU"
    end

    it "should return 'DRLRL MSU | Home'" do
      @title = "Home"
      helper.title.should == "DRLRL MSU | Home"
    end
  end
  
  describe "bootstrap_alert_type" do
    it "should return 'danger' when given 'alert'" do
      helper.bootstrap_alert_type("alert").should == "danger"
      helper.bootstrap_alert_type(:alert).should == "danger"
    end

    it "should return 'danger' when given 'error'" do
      helper.bootstrap_alert_type("error").should == "danger"
      helper.bootstrap_alert_type(:error).should == "danger"
    end

    it "should return 'warning' when given 'notice'" do
      helper.bootstrap_alert_type("notice").should == "warning"
      helper.bootstrap_alert_type(:notice).should == "warning"
    end

    it "should return 'success' when given 'success'" do
      helper.bootstrap_alert_type("success").should == "success"
      helper.bootstrap_alert_type(:success).should == "success"
    end
  end
end

