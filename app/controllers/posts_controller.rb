class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to posts_path 
    else
      redirect_to action: "new"
    end
  end

  def post_params
    params.require(:post).permit(:body, :title, :user_id)
  end
end
