require 'spec_helper'

describe "donations/new.html.erb" do
  before(:each) do
    assign(:donation, stub_model(Donation,
      :success => false,
      :authorization => "MyString",
      :message => "MyString",
      :params => "MyText",
      :first_name => "MyString",
      :last_name => "MyString",
      :ad_website => "MyString",
      :email => "MyString",
      :box_quantity => 1,
      :custom_institution_name => "MyString",
      :custom_classroom_name => "MyString",
      :custom_classroom_teacher => "MyString",
      :custom_classroom_school => "MyString",
      :institution_id => 1,
      :classroom_id => 1
    ).as_new_record)
  end

  it "renders new donation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => donations_path, :method => "post" do
      assert_select "input#donation_success", :name => "donation[success]"
      assert_select "input#donation_authorization", :name => "donation[authorization]"
      assert_select "input#donation_message", :name => "donation[message]"
      assert_select "textarea#donation_params", :name => "donation[params]"
      assert_select "input#donation_first_name", :name => "donation[first_name]"
      assert_select "input#donation_last_name", :name => "donation[last_name]"
      assert_select "input#donation_ad_website", :name => "donation[ad_website]"
      assert_select "input#donation_email", :name => "donation[email]"
      assert_select "input#donation_box_quantity", :name => "donation[box_quantity]"
      assert_select "input#donation_custom_institution_name", :name => "donation[custom_institution_name]"
      assert_select "input#donation_custom_classroom_name", :name => "donation[custom_classroom_name]"
      assert_select "input#donation_custom_classroom_teacher", :name => "donation[custom_classroom_teacher]"
      assert_select "input#donation_custom_classroom_school", :name => "donation[custom_classroom_school]"
      assert_select "input#donation_institution_id", :name => "donation[institution_id]"
      assert_select "input#donation_classroom_id", :name => "donation[classroom_id]"
    end
  end
end
