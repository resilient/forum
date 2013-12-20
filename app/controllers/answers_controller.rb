class AnswersController < ApplicationController
	load_and_authorize_resource

  def new
		@post = Post.find(params[:post_id])
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

end
