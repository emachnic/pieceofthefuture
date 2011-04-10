require 'spec_helper'

describe "donations/index.html.erb" do
  before(:each) do
    assign(:donations, [
      stub_model(Donation,
        :success => false,
        :authorization => "Authorization",
        :message => "Message",
        :params => "MyText",
        :first_name => "First Name",
        :last_name => "Last Name",
        :ad_website => "Ad Website",
        :email => "Email",
        :box_quantity => 1,
        :custom_institution_name => "Custom Institution Name",
        :custom_classroom_name => "Custom Classroom Name",
        :custom_classroom_teacher => "Custom Classroom Teacher",
        :custom_classroom_school => "Custom Classroom School",
        :institution_id => 1,
        :classroom_id => 1
      ),
      stub_model(Donation,
        :success => false,
        :authorization => "Authorization",
        :message => "Message",
        :params => "MyText",
        :first_name => "First Name",
        :last_name => "Last Name",
        :ad_website => "Ad Website",
        :email => "Email",
        :box_quantity => 1,
        :custom_institution_name => "Custom Institution Name",
        :custom_classroom_name => "Custom Classroom Name",
        :custom_classroom_teacher => "Custom Classroom Teacher",
        :custom_classroom_school => "Custom Classroom School",
        :institution_id => 1,
        :classroom_id => 1
      )
    ])
  end

  it "renders a list of donations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Authorization".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Message".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Ad Website".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Custom Institution Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Custom Classroom Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Custom Classroom Teacher".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Custom Classroom School".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
