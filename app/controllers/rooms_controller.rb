class RoomsController < ApplicationController
  def create
    @room = Room.new room_params
    if @room.save
      flash[:success] = "You've made a room!"
      redirect_to root_path
    else
      flash[:error] = "Unable to create room."
      render 'new'
    end
  end

  def show
    @room = Room.find params[:id]
    redirect_to room_messages_path(@room)
  end

  def new
  end

  private

  def room_params
    params.require(:room).permit(:name)
  end
end
