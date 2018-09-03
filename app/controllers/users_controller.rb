class UsersController < ApplicationController
    def new
        @user = User.new
    end
    def index
        @users = User.all
    end
    def show 
        @user = User.find(params[:id])
    end
    def create
        # render plain: params[:post].inspect
        # binding.pry
        @user = User.new(user_params)
        @user.save  
        if true
            redirect_to @user
        else
            render "new"
        end
    end
    private
    def user_params
        params.require(:user).permit(:name,:email,:password)
    end

end
