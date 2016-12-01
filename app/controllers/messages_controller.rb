class MessagesController < ApplicationController

  def index
    @message = Message.new
    @messages = Message.all
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to root_path
    else
      flash.now[:alert] = @message.errors.full_messages.join(",")
      render :index
    end
  end

  private
  def message_params
    params.require(:message).permit(:body)
  end
end
