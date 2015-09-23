class PagesController < ApplicationController
  def home
  end

  def portfolio
  end

  def contact
    @message = Message.new
  end

  def create
    @message = Message.new nom: params[:name], email: params[:email], content: params[:message]
    if @message.save
      UserMailer.contact_form(@message).deliver_now
      flash[:success] = "L'email à bien été envoyé."
      redirect_to '/contact'
    else
      render :contact
    end
  end
end
