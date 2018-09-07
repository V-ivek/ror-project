class CommentsController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        @comment = Comment.new
        @comment[:post_id] = @post[:id]
        @comment[:user_id] = current_user[:id]
        @comment[:owner] = current_user[:email]
        @comment[:comment] = comment_params[:comment]
        @comment.save
        @post.increment!(:comments_count)
        redirect_to post_path(@post)
    end
 
  private
    
    def comment_params
      params.require(:comment).permit(:comment)
    end
    def owner_params
        params.require(:comment).permit(:owner)
    end

end
