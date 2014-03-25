require "spec_helper"

describe ParticipantsController do
  describe "routing" do

    it "routes to #index" do
      get("/participants").should route_to("participants#index")
    end

    it "routes to #new" do
      get("/participants/new").should route_to("participants#new")
    end

    it "routes to #show" do
      get("/participants/1").should route_to("participants#show", :id => "1")
    end

    it "routes to #create" do
      post("/participants").should route_to("participants#create")
    end

    it "routes to #destroy" do
      delete("/participants/1").should route_to("participants#destroy", :id => "1")
    end

  end
end
