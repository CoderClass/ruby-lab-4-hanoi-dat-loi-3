class MessagesController < ApplicationController
  def index
    load_room
    @messages = @room.messages

    respond_to do |format|
      format.json {render json: @messages}
      format.html {@messages}
    end
  end

  def create
    load_room
    @message = @room.messages.build message_params
    if session[:username]
      @message.username = session[:username]
    end
    if @message.save
      redirect_to room_messages_path(@room)
    else
      flash[:error] = "Error: {@message.errors.full.to_sentence}"
      redirect_to root_path
    end
end

  private
  def message_params
    params.require(:message).permit(:username, :content)
  end

  def load_room
    @room = Room.find params[:room_id]
  end
end
