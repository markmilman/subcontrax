class TicketsController < ApplicationController
  def new
    @ticket = Ticket.new
  end

  def index
  end

  def create
    @ticket = Ticket.new(params[:ticket])
    if @ticket.save
      flash[:success] = "Ticket was created successfully"
      redirect_to @ticket
    else
      render 'new'
    end

  end


  def show
    @ticket = Ticket.find(params[:id])
  end

  def destroy
  end
end
