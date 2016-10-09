class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :like, :unlike]
  before_action :check_owned, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :show]
  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.search(params[:search])
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = current_user.reviews.new(review_params)

    respond_to do |format|
      if @review.save
        format.html { redirect_to @review, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def like
    @review.liked_by current_user
    respond_to do |format|
      format.html { redirect_to @review }
      format.js { render layout: false }
    end
  end
  
  def unlike
    @review.unliked_by current_user
    respond_to do |format|
      format.html { redirect_to @review }
      format.js { render layout: false }
    end
  end

  private
    def set_review
      @review = Review.find(params[:id])
    end
    
    def check_owned
      @review = current_user.reviews.find_by_id params[:id]
      if @review.nil?
        respond_to do |format|
          format.html { redirect_to reviews_url, notice: 'You can not edit this review.' }
          format.json { head :no_content }
        end
      end
    end

    def review_params
      params.require(:review).permit(:image, :title, :content,:created_at)
    end
end
