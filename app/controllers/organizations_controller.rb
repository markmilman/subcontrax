class OrganizationsController < ApplicationController
  def new
    @organization = Organization.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @organizationer }
    end
  end

  def create
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
