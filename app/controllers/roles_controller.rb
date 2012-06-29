class RolesController < ApplicationController
  def new
    @role = Role.new
  end

  def create
    @role = Role.new(params[:role])
    if @role.save
      flash[:success] = "Role Created Successfully"
      redirect_to @role
    end
  end

  def index
    @roles = Role.paginate(page: params[:page], per_page: 10)
  end

  def show
    @role = Role.find(params[:id])

  end

  def edit
  end

  def update
  end
end
