class MicropostsController < ApplicationController

  before_filter :signed_in_user

  def create
    @micropost = current_user.microposts.build(params[:micropost])
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to user_path current_user
    else
      @user = current_user
      @microposts = @user.microposts.paginate(page: params[:page])
      render "users/show", user: current_user
    end


  end

  def destroy

  end
end