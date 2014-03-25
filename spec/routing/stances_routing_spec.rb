require "spec_helper"

describe StancesController do
  describe "routing" do

    it "routes to #index" do
      get("/stances").should route_to("stances#index")
    end

    it "routes to #new" do
      get("/stances/new").should route_to("stances#new")
    end

    it "routes to #show" do
      get("/stances/1").should route_to("stances#show", :id => "1")
    end

    it "routes to #edit" do
      get("/stances/1/edit").should route_to("stances#edit", :id => "1")
    end

    it "routes to #create" do
      post("/stances").should route_to("stances#create")
    end

    it "routes to #update" do
      put("/stances/1").should route_to("stances#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/stances/1").should route_to("stances#destroy", :id => "1")
    end

  end
end
