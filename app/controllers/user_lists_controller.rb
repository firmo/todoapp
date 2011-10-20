class UserListsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @list = List.find(params[:list_id])
    @user_list = UserList.new(params[:user_list])

    @user_list.save

    redirect_to @list
  end

  def destroy
    @list = List.find(params[:list_id])
    @user_list = UserList.find(params[:id])

    @user_list.destroy

    redirect_to @list
  end
end