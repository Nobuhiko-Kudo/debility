class UsersController < ApplicationController
  def create
    user = User.create(:user_name => params[:user_name])
    cookies.permanent['user_id'] = user.id
    render json: user
  end

  def update
  end
end
