class PostsController < ApplicationController
  def index
    @post = Post.all
  end

  before_action :authenticate_user!, except: %i[index]

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to posts_path
    else
      # redirect_to action: 'new'
      render :new
    end
  end

  def post_params
    params.require(:post).permit(:body, :title, :user_id)
  end
end
