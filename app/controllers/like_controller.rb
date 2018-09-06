class LikeController < ApplicationController

    def add_like
        p = Post.find_by_id(params[:id])
        if !p.likes.find_by_user_id(current_user.id)
            binding.pry
    end

end
