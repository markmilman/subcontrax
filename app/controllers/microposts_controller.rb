class MicropostsController < ApplicationController

  before_filter :signed_in_user
  before_filter :correct_user, only: :destroy

  def create
    @micropost = current_user.microposts.build(params[:micropost])
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to user_path current_user
    else
      @user = current_user
      #@microposts = @user.microposts.paginate(page: params[:page])
      @feed_items = []
      render "users/show", user: current_user
    end


  end

  def destroy
    content = @micropost.content
    @micropost.destroy
    if @micropost.destroyed?

      flash[:success] = "The following post was deleted successfully: #{content}"
    else
      flash[:error] = "Could not delete the post"

    end

    redirect_to controller: :users, action: :show, id: current_user.id
  end

  private

  def correct_user
    @micropost = current_user.microposts.find(params[:id])

  rescue
    @micropost = current_user.microposts.find_by_id(params[:id])
    redirect_to controller: :users, action: :show, id: current_user.id
  end

end