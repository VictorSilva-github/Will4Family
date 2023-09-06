class ProfilesController < ApplicationController
  class ProfilesController < ApplicationController
    #before_action :set_user
    #before_action :set_message, only: [:destroy, :edit]

    def index
      # Mostrar usuários e suas mensagens
    end

    def new
      @message = @user.messages.build
      # OU
      @user = Message.new # PERGUNTAR ROBERTO
    end

    def create
      @message = @user.messages.build(message_params)
      if @message.save
        redirect_to user_path(@user), notice: 'Message was successfully created.'
      else
        render :new
      end
    end

    def destroy
      @message.destroy
      redirect_to user_path(@user), notice: 'Message was successfully deleted.'
    end

    private

    def set_user
      @user = User.find(params[:user_id])
    end

    def set_message
      @message = @user.messages.find(params[:id])
    end

    def message_params
      params.require(:message).permit(:user_id, :message_type, :description, :user_checkin, :last_checkin_at, :tolerance_days, :ultimate_date)
      # você deve trocar isso para corresponder aos parâmetros corretos da mensagem
    end
  end

end
