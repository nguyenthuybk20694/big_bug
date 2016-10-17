class Admin::ReviewsController < Admin::AdminController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.all.paginate(:page => params[:page],:per_page => 10);
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
  end

  # # GET /reviews/new
  # def new
  #   @review = Review.new
  # end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  # POST /reviews.json
  # def create
  #   @review = current_user.reviews.new(review_params)

  #   respond_to do |format|
  #     if @review.save
  #       format.html { redirect_to @review, notice: 'Review was successfully created.' }
  #       format.json { render :show, status: :created, location: @review }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @review.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

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
      format.html { redirect_to admin_reviews_path, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  private
    def set_review
      @review = Review.find(params[:id])
    end
    def review_params
      params.require(:review).permit(:image, :title, :content,:created_at)
    end
end
