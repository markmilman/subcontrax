class UsersController < ApplicationController

  before_filter :signed_in_user, only: [:edit, :update, :index]
  before_filter :correct_user, only: [:edit, :update]
  before_filter :admin_user, only: :destroy

  def new
    if !signed_in?
      @user = User.new
    else
      flash[:warning] = "You are already signed up"
      redirect_to root_path
    end

  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
    @micropost = @user.microposts.build if signed_in?

  end

  def create
    if !signed_in?
      @user = User.new(params[:user])

      if @user.save
        sign_in @user
        flash[:success] = "Welcome to SubConTraX!"
        redirect_to @user
      else
        render 'new'
      end
    else
      flash[:warning] = "You are already signed up"
      redirect_to root_path
    end

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def destroy

    user = User.find(params[:id]).destroy
    if current_user != user
      flash[:success] = "User deleted."
      redirect_to users_path
    else
      flash[:error] = "Invalid action: You can't delete your own user"
      redirect_to root_path

    end
  end

  private

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end

end
