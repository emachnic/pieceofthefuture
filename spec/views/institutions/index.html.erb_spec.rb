require 'spec_helper'

describe "institutions/index.html.erb" do
  before(:each) do
    assign(:institutions, [
      stub_model(Institution,
        :name => "Name",
        :school_site => "School Site",
        :contact_name => "Contact Name",
        :contact_email => "Contact Email",
        :contact_title => "Contact Title",
        :street_one => "Street One",
        :street_two => "Street Two",
        :city => "City",
        :state => "State",
        :postal_code => "Postal Code",
        :phone => "Phone",
        :wish_list => "MyText"
      ),
      stub_model(Institution,
        :name => "Name",
        :school_site => "School Site",
        :contact_name => "Contact Name",
        :contact_email => "Contact Email",
        :contact_title => "Contact Title",
        :street_one => "Street One",
        :street_two => "Street Two",
        :city => "City",
        :state => "State",
        :postal_code => "Postal Code",
        :phone => "Phone",
        :wish_list => "MyText"
      )
    ])
  end

  it "renders a list of institutions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "School Site".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Contact Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Contact Email".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Contact Title".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Street One".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Street Two".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "City".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "State".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Postal Code".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
