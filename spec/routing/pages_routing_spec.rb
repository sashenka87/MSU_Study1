require "spec_helper"

describe PagesController do
  describe "routing" do
    
    it "routes to the welcome page" do
      get("/").should route_to("pages#welcome")
    end

    it "routes to the goodbye page" do
      get("/goodbye").should route_to("pages#goodbye")
    end

    it "routes to the directions page" do
      get("/directions").should route_to("pages#directions")
    end

    it "routes to the library page" do
      get("/library").should route_to("pages#library")
    end

    it "routes to the ranking page" do
      get("/ranking").should route_to("pages#ranking")
    end
  end
end