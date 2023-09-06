class ReceivesController < ApplicationController
  def index
    @receives = Receive.all
  end

  def show
    @receive = Receive.find(params[:id])
  end

  def new
    @receive = Receive.new
  end

  def create
    @receive = Receive.new(receive_params)
    @receive.user = current_user
    if @receive.save
      redirect_to @receive
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    @receive = Receive.find(params[:id])
  end

  def update
    @receive = Receive.find(params[:id])
    if @receive.update(receive_params)
      redirect_to @receive
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @receive = Receive.find(params[:id])
    @receive.destroy
    redirect_to receives_path
  end

  private

  def receive_params
    params.require(:receive).permit(:name, :email, :relationship, :phone_number, :aditional_info)
  end

  def message_params
    params.require(:message).permit(:message_type, :description, :user_cheking, :last_checking_at, :tolerance_days, :ultimate_date, :user_id)
  end
end
