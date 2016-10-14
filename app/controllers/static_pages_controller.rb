class StaticPagesController < ApplicationController
	before_action :authenticate_user!, only: [:profile,:manager_reviews]
	before_action :require_admin,only: [:manager_reviews]
  def home
  end
  def profile
  	@user = current_user
  end
  def manager_reviews
  	@reviews = Review.all;
  end
end
