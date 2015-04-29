class MessagesController < ApplicationController

  def index
    @messages = Message.all
  end

  def create  
    @message = Message.new(message_params)
    @message.user_id = current_user.id
    @message.save!
  end


  private 

    def message_params
      params.require(:message).permit(:body)
    end

end