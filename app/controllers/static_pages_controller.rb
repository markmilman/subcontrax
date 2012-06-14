class StaticPagesController < ApplicationController

  def welcome
  end

  def home
    unless signed_in?
      redirect_to welcome_path
    end
    @tickets = Ticket.all
  end

  def help
  end

  def about

  end

  def contact

  end
end
