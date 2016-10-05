class StaticPagesController < ApplicationController
	before_action :authenticate_user!, only: [:profile]
  def home
  	@user = User.all
  end
  def profile
  	@user = current_user
  end
end
