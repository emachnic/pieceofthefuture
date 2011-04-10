require 'spec_helper'

describe Classroom do
  it "should create a Classroom given valid attributes" do
    @classroom = Fabricate.build(:classroom)
    @classroom.should be_valid
  end
end
