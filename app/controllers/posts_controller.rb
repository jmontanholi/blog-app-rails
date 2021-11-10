class PostsController < ApplicationController
  def index
    user = User.find_by(id: params[:user])
    @user = user
    @posts = user.posts
  end

  def show
    @user = User.find_by(id: params[:user])
    @post = Post.find_by(id: params[:id])
  end

  def new
    unless session[:user_id]
      redirect_to '/sessions/new'
    end
  end

  def create
    post = Post.new(
      title: params[:title],
      text: params[:text],
      comments_counter: 0,
      likes_counter: 0,
      user_id: session[:user_id]
    )

    if post.save
      flash[:notice] = 'Post successfully created'
      redirect_to "/users/#{session[:user_id]}/posts"
    end
  end
end
