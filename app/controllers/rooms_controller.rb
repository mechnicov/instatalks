class RoomsController < ApplicationController
  def index
    @rooms = Room.all
    @room = Room.new
  end

  def show
    @room = Room.find_by(token: params[:token])
  end

  def create
    @room = Room.create!
    redirect_to @room, notice: 'Room was successfully created.'
  end

  private

  def set_users
    @users = User.all
  end
end
