class OrganizationsController < ApplicationController
  def new
    @organization = Organization.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @organization }
    end
  end

  def create
    @organization = Organization.new(params[:organization])

    if @organization.save
      flash[:success] = "Organization Created"
      redirect_to @organization
    else
      render 'new'
    end
  end

  def show

  end

  def index
  end

  def edit
  end

  def subregion_options
    render partial: 'shared/subregion_select'
  end
end
