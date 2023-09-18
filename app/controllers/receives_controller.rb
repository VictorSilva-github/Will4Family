# class ReceivesController < ApplicationController


#   def index
#     @receives = Receive.all
#   end

#   def show
#     @receive = Receive.find(params[:id])
#   end

#   def new
#     if params.key?(:message)
#       @message = Message.find(params[:message])
#     end
#     @receive = Receive.new
#   end

#   def create
#     @receive = Receive.new(receive_params)
#     @receive.user = current_user
#     if @receive.save
#       # raise
#       redirect_to new_message_receive_message_path(message_permitted[:message_id])
#     else
#       @message = Message.find(message_permitted[:message_id])
#       render 'new', status: :unprocessable_entity
#     end
#   end

#   def edit
#     if params.key?(:message)
#       @message = Message.find(params[:message])
#     end
#     @receive = Receive.find(params[:id])
#   end

#   def update
#     @receive = Receive.find(params[:id])
#     if @receive.update(receive_params)
#       redirect_to message_path(message_permitted[:message_id])
#     else
#       @message = Message.find(message_permitted[:message_id])
#       render 'edit', status: :unprocessable_entity
#     end
#   end

#   def destroy
#     @receive = Receive.find(params[:id])
#     @receive.receive_messages.destroy.all
#     @receive.destroy
#     redirect_to message_path
#   end

#   private

#   def message_permitted
#     params.require(:receive).permit(:message_id)
#   end

#   def receive_params
#     params.require(:receive).permit(:name, :email, :relationship, :phone_number, :additional_info)
#   end

#   def message_params
#     params.require(:message).permit(:message_type, :description, :checkin_days, :last_checking_at, :tolerance_days, :ultimate_date)
#   end
# end
