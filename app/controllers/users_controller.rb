class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @created_events = @user.events
    @attended_events = @user.attendees
  end
end
