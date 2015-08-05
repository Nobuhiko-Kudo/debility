class UsersController < ApplicationController
  def create
    user = User.create!(:user_name => params[:user_name])
    cookies.permanent['user_token'] = user.id
    render json: { user_name:user.user_name }
  end

  def update
  end

  def show
    user = User.find(params[:id])
    render json: { user_name:user.user_name }
  end
end
