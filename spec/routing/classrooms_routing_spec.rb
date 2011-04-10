require "spec_helper"

describe ClassroomsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/classrooms" }.should route_to(:controller => "classrooms", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/classrooms/new" }.should route_to(:controller => "classrooms", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/classrooms/1" }.should route_to(:controller => "classrooms", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/classrooms/1/edit" }.should route_to(:controller => "classrooms", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/classrooms" }.should route_to(:controller => "classrooms", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/classrooms/1" }.should route_to(:controller => "classrooms", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/classrooms/1" }.should route_to(:controller => "classrooms", :action => "destroy", :id => "1")
    end

  end
end
