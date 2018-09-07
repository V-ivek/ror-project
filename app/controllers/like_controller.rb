class LikeController < ApplicationController

    def add_like
        p = Post.find_by_id(params[:id])
        #binding.pry
        if user_signed_in?
            if !p.likes.find_by_user_id(current_user.id)
                p.increment!(:likes_count)
                like=Like.new
                like.user_id=current_user.id
                like.post_id=p.id
                like.save
            end
        else
            redirect_to new_user_session_path and return 
        end
        redirect_to "/posts"
    end

end
