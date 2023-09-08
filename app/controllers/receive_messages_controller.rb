class ReceiveMessagesController < ApplicationController

  def new
    @receive_message = ReceiveMessage.new
    @message = Message.find(params[:message_id])
  end

  def create
    @message = Message.find(params[:message_id])
    @receive_message = ReceiveMessage.new(receive_message_params)
    @receive_message.message = @message
    if @receive_message.save
      redirect_to message_path(@receive_message.message)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @receive_message = ReceiveMessage.find(params[:id])
    @receive_message.destroy
    redirect_to message_path(@receive_message.message)
  end

  private

  def receive_message_params
    params.require(:receive_message).permit(:receive_id)
  end
end
