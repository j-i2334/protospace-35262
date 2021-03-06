class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to "/prototypes/#{@comment.prototype.id}"
      # redirect_to root_path
    else
      @prototype = @comment.prototype
      @comments = @prototype.comments
      render :"prototypes/show"
      # render :show
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id]) 
  end
end
