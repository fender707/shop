class MessagesController < ApplicationController

  before_filter :delete_dialogue
  
  def index
    @messages = Message.all
  end

  def create  
    
    @message = Message.new(message_params)
    @message.user_id = current_user.id
    @message.title = current_user.email
    @message.save!
    
  end
  
  def delete_dialogue
    Message.destroy_all
  end

  private 

    def message_params
      params.require(:message).permit(:title,:body)
    end

end
