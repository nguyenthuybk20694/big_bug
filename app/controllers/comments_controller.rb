class CommentsController < ApplicationController
  before_action :set_comment
  before_action :check_owned, only: [:edit, :update, :destroy]    
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
    def create
        if current_user
            @review = Review.find(params[:review_id])
            @comment = @review.comments.create(comment_params)
            @comment.user_id = current_user.id
            @comment.save
            render 'save'
        end
    end
    
    def edit
        
    end
    
    def update
        @comment.update (comment_params)
        redirect_to @review
    end
    
    def destroy
        @id = @comment.id
        @comment.destroy
        render 'destroy'
    end
    
    private 
    
    def comment_params
        params.require(:comment).permit(:body, :review_id,:user_id)    
    end
    
    def set_comment
        @review = Review.find_by_id params[:review_id]
        @comment = @review.comments.find_by_id params[:id]
    end
    
    def check_owned
      @comment = current_user.comments.find_by_id params[:id]
      if @comment.nil?
        respond_to do |format|
          format.html { redirect_to :back, notice: 'You can not edit this comment.' }
          format.json { head :no_content }
        end
      end
    end
end
