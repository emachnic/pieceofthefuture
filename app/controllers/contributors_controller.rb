class ContributorsController < ApplicationController
  def index
    @donations = Donation.order("box_quantity DESC").paginate(:page => params[:page], :per_page => 50)
  end

end
