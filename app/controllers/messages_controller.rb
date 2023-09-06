class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :destroy, :edit, :update]
  skip_before_action :authenticate_user!, only: [:index, :show ]

  def index
    @messages = current_user.messages
    @receives = current_user.receives
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user

    if @message.save
      redirect_to new_receive_path, notice: 'Message was successfully created.'
    else
      render :new, notice: "Sorry. The message couldn't be created."
    end
  end

  def edit
    @message = Message.find(params[:id])
  end

  def update
    @message = Message.find(params[:id])
    if @message.update(message_params)
      redirect_to @message
    else
      render 'edit'
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to messages_path
  end

  private

  def set_message
    @message = Message.find(params[:id])
  end

  # Talvez ARRUMAR AQUI
  def message_params
    params.require(:message).permit(:message_type, :description, :user_cheking, :tolerance_days, :ultimate_date)
  end
end
