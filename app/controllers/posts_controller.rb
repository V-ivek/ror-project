class PostsController < ApplicationController
    def new
        @post = Post.new
    end
    def index
        @posts = Post.all
    end
    def show 
        @post = Post.find(params[:id])
    end
    def create
        # render plain: params[:post].inspect
        # binding.pry
        @post = Post.new(post_params)
        @post.user_id = 1
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

    private
    def post_params
        params.require(:post).permit(:owner,:content)
    end
end
