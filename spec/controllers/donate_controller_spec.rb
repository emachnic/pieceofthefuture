require 'spec_helper'

describe DonateController do

  describe "GET 'send_email'" do
    it "should be successful" do
      get 'send_email'
      response.should be_success
    end
  end

end
