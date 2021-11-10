class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    user = User.find_by(id: params[:id])
    @user = user
    @posts = user.show_recent
  end

  def new; end

  def create
    user = User.new(
      name: params[:name],
      photo: params[:photo],
      bio: params[:bio],
      posts_counter: 0
    )
    if user.save
      p 'Working'
      flash[:notice] = 'User was successfully created'
      redirect_to users_path
    end
  end
end
