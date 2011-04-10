require 'spec_helper'

describe Institution do
  it "should create an Institution given valide attributes" do
    @institution = Fabricate.build(:institution)
    @institution.should be_valid
  end
end
