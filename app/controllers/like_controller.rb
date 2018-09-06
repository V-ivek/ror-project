class LikeController < ApplicationController

    def add_like
        p = Post.find_by_id(params[:id])
        #binding.pry
        if !p.likes.find_by_user_id(current_user.id)
            p.increment!(:likes_count)
            like=Like.new
            like.user_id=current_user.id
            like.post_id=p.id
            like.save
        end
        redirect_to "/posts"
    end

end
