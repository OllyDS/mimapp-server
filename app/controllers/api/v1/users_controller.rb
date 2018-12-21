class Api::V1::UsersController < ApplicationController

    def index
        @users = User.all
        render json: @users
    end

    def show
        @user = User.find(params[:id])
        render json: @user
    end

    def login
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            render json: { currentUser: @user.id }
        else
            render json: { error: 'Username/Password Invalid.'}, status: 401
        end
    end

    def create
        @user = User.new(user_params)
        if @user.save
            render json: @user
        else
            render json: {error: 'Error - Unable to create User.'}, status: 400
        end
    end

    
    private

    def user_params
      params.require(:user).permit(:username, :first_name, :last_name, :image_url, :password, :password_confirmation )
    end


end #End of Users Controller
