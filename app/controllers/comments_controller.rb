class CommentsController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        @comment = Comment.new
        @comment[:post_id] = @post[:id]
        if user_signed_in?
            @comment[:user_id] = current_user[:id]
            @comment[:owner] = current_user[:email]
        else
            @comment[:user_id] = 0
            @comment[:owner] = "Anonymous"
            @comment[:comment] = comment_params[:comment]
        end
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
