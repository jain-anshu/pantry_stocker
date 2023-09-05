class UsersController < ApplicationController
    before_action :authenticate_user!
    def index
        @users = User.all
        render json: @users
    end
    def create
        @user = User.new(user_params)
        if @user.save
            render json: { status: 'Success' }, status: :created
        else
            render json: { errors: @user.error_messages }, status: :unprocessable_entity
        end
    end
    private
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :is_admin)
    end
end