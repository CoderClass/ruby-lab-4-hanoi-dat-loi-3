class MessagesController < ApplicationController
  def index
    @messages = Message.where(room_id: params[:room_id])
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.build message_params

    if session[:username]
      @message.username = session[:username]
    end

    if @message.save
      redirect_to room_messages_path(@room)
    else
      flash[:error] = "Something is wrong here"
      redirect_to room_messages_path(@room)
    end

  end


  private

  def message_params
    params.require(:message).permit(:username, :content)
  end
end
