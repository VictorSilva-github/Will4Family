class MessagesController < ApplicationController
  before_action :set_message, only: [ :show, :destroy, :update ]
  skip_before_action :authenticate_user!, only: [ :index, :show ]

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
      ###### AQUI #####

      redirect_to new_message_receive_message_path(@message), notice: 'Message was successfully created.'
    else
      render :new, notice: "Sorry. The message couldn't be created."
    end
  end

  def edit
    @message = Message.find(params[:id])
  end

  def update
    # @message = Message.find(params[:id])
    if @message.update(message_params)
      redirect_to @message
    else
      render 'edit'
    end
  end

  def destroy
    @message.destroy
    redirect_to messages_path
  end

  private

  def set_message
    @message = Message.find(params[:id])
  end

    # CASO PRECISE NOVAMENTE
  # def send
  #   if @message.ultimate_date.present?
  #     delivery_time = @message.ultimate_date - Date.today
  #     ReceiveCheckMailer.receive_check_email(@message.user.receives.first.email, @message).deliver_later(wait_until: delivery_time)
  #     #deliver_now
  #     # caso o for ultimate
  #   end
  # end

  def message_params
    params.require(:message).permit(:title, :message_type, :description, :ultimate_date, :sent)
  end
end
