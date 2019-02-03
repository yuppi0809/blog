class PostsController < ApplicationController

layout 'posts'
before_action :authenticate_user!, only: [:new, :show]
before_action :move_to_index, except: [:index, :new]

  def index
    @posts = Post.all.order("created_at DESC")

  end

  def show
    @post = Post.find(params[:id])

  end

  def create
    Post.create(create_params)
    redirect_to "/"
  end

  def new
    @post = Post.new
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to "/"
  end

   def edit
    @post = Post.find(params[:id])
  end

   def update
    post = Post.find(params[:id])
    post.update(create_params)
    post.save
    redirect_to "/"
  end

private
  def move_to_index
    redirect_to "/" unless user_signed_in?
  end

  def create_params
    params.require(:post).permit(:title,:text).merge({user_id: current_user.id})
  end
end
