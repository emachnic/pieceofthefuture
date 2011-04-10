require "spec_helper"

describe InstitutionsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/institutions" }.should route_to(:controller => "institutions", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/institutions/new" }.should route_to(:controller => "institutions", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/institutions/1" }.should route_to(:controller => "institutions", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/institutions/1/edit" }.should route_to(:controller => "institutions", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/institutions" }.should route_to(:controller => "institutions", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/institutions/1" }.should route_to(:controller => "institutions", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/institutions/1" }.should route_to(:controller => "institutions", :action => "destroy", :id => "1")
    end

  end
end
