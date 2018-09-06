class PostsController < ApplicationController
    def new
        @post = Post.new
    end
    def index
        @posts = Post.all
    end
    def edit
        @post = Post.find(params[:id])
    end
    def show 
        @post = Post.find(params[:id])
    end
    def create
        # render plain: params[:post].inspect
        # binding.pry
        @post = Post.new(post_params)
        #insert user_id of logged in user once devise is setup 
        @post.user_id = current_user.id
        @post.likes_count = 0
        @post.comments_count = 0
        @post.save  
        if true
            redirect_to @post
        else
            render "new"
        end
    end
    def update
        @post = Post.find(params[:id])
        @post.user_id = 1
        if @post.update(post_params)
            redirect_to(@post)
        else
            render "edit"
        end
    end
    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to posts_path
    end
    def like
        @post = Post.find(params[:id])
        @user = current_users
    end
    private
    def post_params
        params.require(:post).permit(:id,:owner,:title,:content,:likes_count,:comments_count)
    end
end
