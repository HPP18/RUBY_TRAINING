class PostsController < ApplicationController
  def index
    @posts = PostService.getAllPosts
  end

  def show
    @post = PostService.getPostById(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @is_post_create = PostService.createPost(@post)
    if @is_post_create
      flash[:success] = "Created successfully"
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = PostService.getPostById(params[:id])
  end

  def update
    @post = PostService.getPostById(params[:id])
    @is_post_update = PostService.updatePost(@post, post_params)
    if @is_post_update
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = PostService.getPostById(params[:id])
    @is_post_destroy = PostRepository.destroy(@post)

    if @is_post_destroy
      redirect_to posts_path, status: :see_other
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :status)
  end
end
