class MessagesController < ApplicationController
  def list
    if user_signed_in?
      @message = Message.where(checked: 0).reverse
    else
      redirect_to '/'
    end
  end

  def destroy
    if user_signed_in? && params[:id]
      Message.update(params[:id], :checked => '1')
      redirect_to '/messages'
    else
      redirect_to '/'
    end
  end
end
