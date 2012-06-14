class TicketsController < ApplicationController
  def new
    @ticket = Ticket.new
  end

  def index
    #@tickets = Ticket.paginate(page: params[:page])
    @tickets = Ticket.search(params[:search])
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

    ticket = Ticket.find(params[:id]).destroy

    respond_to do |format|
      format.html do
        if ticket.destroyed?
          flash[:success] = "Ticket deleted."
          redirect_to tickets_path
        else
          flash[:error] = "Invalid action: ticket was not deleted"
          redirect_to tickets_path
        end
      end
      format.js { render :js => "$('#delete#{ticket.id}').parent().hide('slow')" }
    end
  end
end
