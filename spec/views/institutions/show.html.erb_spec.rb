require 'spec_helper'

describe "institutions/show.html.erb" do
  before(:each) do
    @institution = assign(:institution, stub_model(Institution,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/School Site/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Contact Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Contact Email/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Contact Title/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Street One/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Street Two/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/City/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/State/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Postal Code/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Phone/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
