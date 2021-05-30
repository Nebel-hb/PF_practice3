class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = @post.id
    @comment.save
    @post.create_notification_comment!(current_user, @comment.id)
    redirect_to post_path(@post)  
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :post_id)
  end

end
