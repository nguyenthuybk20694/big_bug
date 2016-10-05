class ReviewsController < ApplicationController
	def create
    @review = Review.new(review_params)
    if @review.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end
  private

    def review_params
      params.require(:review).permit(:content)
    end
end
