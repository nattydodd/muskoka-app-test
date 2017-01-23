class UsersController < ApplicationController

  before_filter :authorize, :only => [:show, :update, :destroy, :edit]

  def index
    @users = User.all
  end

  def home
    @user = User.new
    @entries = Entry.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to new_entry_url
    else
      render :new
    end

  end

  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html
      format.js
      format.json do
        render json: @user
      end
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to user_url(@user)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
