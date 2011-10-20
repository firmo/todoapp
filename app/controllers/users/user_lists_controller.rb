class Users::UserListsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @lists = @user.watched_lists.paginate(:page => params[:page])
  end
end