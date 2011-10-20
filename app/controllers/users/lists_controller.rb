class Users::ListsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    if(params[:user_id].to_i == current_user.id)
      @lists = List.where(:user_id => params[:user_id]).paginate(:page => params[:page])
    else
      @lists = List.where(:public => true, :user_id => params[:user_id]).paginate(:page => params[:page])
    end
  end

end
