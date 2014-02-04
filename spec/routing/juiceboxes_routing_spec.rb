require "spec_helper"

describe JuiceboxesController do
  describe "routing" do

    it "routes to #index" do
      get("/juiceboxes").should route_to("juiceboxes#index")
    end

    it "routes to #new" do
      get("/juiceboxes/new").should route_to("juiceboxes#new")
    end

    it "routes to #show" do
      get("/juiceboxes/1").should route_to("juiceboxes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/juiceboxes/1/edit").should route_to("juiceboxes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/juiceboxes").should route_to("juiceboxes#create")
    end

    it "routes to #update" do
      put("/juiceboxes/1").should route_to("juiceboxes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/juiceboxes/1").should route_to("juiceboxes#destroy", :id => "1")
    end

  end
end
