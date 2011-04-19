require 'spec_helper'

describe Donation do
  context "create" do
    it "should decrement the Box quantity" do
      @box = Factory(:box, :quantity => 200000)
      @box_quantity = @box.quantity
      @donation = Factory.build(:donation, :box_quantity => 1)
      @donation.save
      @box.quantity.should == (@box_quantity - @donation.box_quantity)
    end
  end
end
