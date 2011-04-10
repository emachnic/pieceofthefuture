require 'spec_helper'

describe "donations/show.html.erb" do
  before(:each) do
    @donation = assign(:donation, stub_model(Donation,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Authorization/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Message/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/First Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Last Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Ad Website/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Email/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Custom Institution Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Custom Classroom Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Custom Classroom Teacher/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Custom Classroom School/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
