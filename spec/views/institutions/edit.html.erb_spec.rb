require 'spec_helper'

describe "institutions/edit.html.erb" do
  before(:each) do
    @institution = assign(:institution, stub_model(Institution,
      :name => "MyString",
      :school_site => "MyString",
      :contact_name => "MyString",
      :contact_email => "MyString",
      :contact_title => "MyString",
      :street_one => "MyString",
      :street_two => "MyString",
      :city => "MyString",
      :state => "MyString",
      :postal_code => "MyString",
      :phone => "MyString",
      :wish_list => "MyText"
    ))
  end

  it "renders the edit institution form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => institutions_path(@institution), :method => "post" do
      assert_select "input#institution_name", :name => "institution[name]"
      assert_select "input#institution_school_site", :name => "institution[school_site]"
      assert_select "input#institution_contact_name", :name => "institution[contact_name]"
      assert_select "input#institution_contact_email", :name => "institution[contact_email]"
      assert_select "input#institution_contact_title", :name => "institution[contact_title]"
      assert_select "input#institution_street_one", :name => "institution[street_one]"
      assert_select "input#institution_street_two", :name => "institution[street_two]"
      assert_select "input#institution_city", :name => "institution[city]"
      assert_select "input#institution_state", :name => "institution[state]"
      assert_select "input#institution_postal_code", :name => "institution[postal_code]"
      assert_select "input#institution_phone", :name => "institution[phone]"
      assert_select "textarea#institution_wish_list", :name => "institution[wish_list]"
    end
  end
end
