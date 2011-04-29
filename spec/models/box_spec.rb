require 'spec_helper'

describe Box do
  it "should create a Box given valid attributes" do
    @box = Factory.build(:box)
    @box.should be_valid
  end
  
  it "should reject a Box without a name" do
    @box = Factory.build(:box, :name => "")
    @box.should_not be_valid
  end
  
  it "should reject a Box without a number" do
    @box = Factory.build(:box, :quantity => "")
    @box.should_not be_valid
  end
  
  it "should reject a Box with a negative number" do
    @box = Factory.build(:box, :quantity => -100)
    @box.should_not be_valid
  end
  
  it "should reject a Box with a decimal number" do
    @box = Factory.build(:box, :quantity => 1.5)
    @box.should_not be_valid
  end
end