class PostsController < ApplicationController

  def index
    @posts = Post.all
    @post = Post.new
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

    respond_to do |format|
      if @is_post_create
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.js
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @post = PostService.getPostById(params[:id])
  end

  def update
    @post = PostService.getPostById(params[:id])
    @is_post_update = PostService.updatePost(@post, post_params)
    if @is_post_update
      redirect_to posts_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = PostService.getPostById(params[:id])
    @is_post_destroy = PostRepository.destroy(@post)

    if @is_post_destroy
      respond_to do |format|
        format.html { redirect_to posts_path }
        format.json { head :no_content }
        format.js { render :layout => false }
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :status)
  end
end
