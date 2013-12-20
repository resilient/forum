class PostsController < ApplicationController
	load_and_authorize_resource

  def index
    @posts = Post.order("created_at DESC").all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.new(params[:post])

    if @post.save
	    save_action_to_log('created', @post.id, 'post', @post.title)
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render action: "new"
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(params[:post])
	    save_action_to_log('updated', @post.id, 'post', @post.title)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])

    save_action_to_log('deleted', @post.id, 'post', @post.title)

    @post.destroy

    redirect_to posts_url
  end
end
