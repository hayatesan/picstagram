class PostsController < ApplicationController
  def index
    @posts = Post.all.order("id DESC")
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    post.save!
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update!(post_params)
    redirect_to posts_url, notice: "タスク「#{post.name}」を更新しました。"
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_url, notice: "タスク「#{post.name}」を削除しました。"
  end


  private

  def post_params
    params.permit(:name, :text, :image)
  end

end
