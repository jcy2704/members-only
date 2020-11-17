class PostsController < ApplicationController
  #before_action :authenticate_user!

  def new
    post = Post.new
  end

  def create
    post = Post.new(post_params)
  end

  def post_params
    params.require(:posts).permit(:body, :title, :user_id)
  end
end
