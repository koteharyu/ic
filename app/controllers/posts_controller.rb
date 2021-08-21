class PostsController < ApplicationController
  before_action :require_login, only: [:new, :show, :create, :edit, :update, :destroy]

  def index
    @posts = Post.includes(:user).order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to posts_path, success: '投稿しました'
    else
      render :new
    end
  end

  def edit
    post
  end

  def update
    if post.update(post_params)
      redirect_to post_path(post), success: '投稿を更新しました'
    else
      flash.now[:danger] = "投稿の更新に失敗しました"
      render :edit
    end
  end

  def destroy
    post.destroy!
    redirect_to posts_path, success: '投稿を削除しました'
  end

  def post
    @post ||= current_user.posts.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:body, images: [])
  end
end
