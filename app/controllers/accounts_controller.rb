class AccountsController < ApplicationController
  def index
    @users = User.order("created_at DESC").all

    authorize! :read, @users
  end

  def new
    @user = User.new

    authorize! :create, @user
  end

  def edit
    @user = User.find(params[:id])

    authorize! :update, @user
  end

  def create
    @user = User.new(params[:user])

    authorize! :create, @user

    if @user.save
      redirect_to accounts_path, notice: 'User was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @user = User.find(params[:id])

    authorize! :update, @user

    if @user.update_attributes(params[:user])
      redirect_to accounts_path, notice: 'User was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])

    authorize! :destroy, @user

    @user.destroy

    redirect_to accounts_url
  end
end
