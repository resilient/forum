class AnswersController < ApplicationController
	load_and_authorize_resource

  def new
		@post = Post.find(params[:post_id])
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def create
	  params[:answer][:user_id] = current_user.id

	  @post = Post.find(params[:post_id])

    @answer = @post.answers.new(params[:answer])

    if @answer.save
      redirect_to post_path(@post), notice: 'Answer was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @answer = Answer.find(params[:id])

    if @answer.update_attributes(params[:answer])
      redirect_to posts_url, notice: 'Answer was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy

    redirect_to posts_url
  end
end
