class ReceivesController < ApplicationController

  def index
    @receives = Receive.all
  end

  def new
    @receive = Receive.new
  end

  # Talvez ARRUMAR AQUI
  def create
    @receive = Receive.new(receive_params)
    if @receive.save
      redirect_to @receive
    else
      render 'new'
    end
  end

  def show
    @receive = Receive.find(params[:id])
  end

  def edit
    @receive = Receive.find(params[:id])
  end

  # Talvez ARRUMAR AQUI
  def update
    @receive = Receive.find(params[:id])
    if @receive.update(receive_params)
      redirect_to @receive
    else
      render 'edit'
    end
  end

  def destroy
    @receive = Receive.find(params[:id])
    @receive.destroy
    redirect_to receives_path
  end

  private

   #Talvez ARRUMAR AQUI
  def receive_params
    params.require(:receive).permit(:title, :text)
  end

  def message_params
    params.require(:message).permit(:message_type, :description, :user_cheking, :last_checking_at, :tolerance_days, :ultimate_date, :user_id)
  end
end
