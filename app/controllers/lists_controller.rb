class ListsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  respond_to :html

  def index
    @lists = List.where(:public => true).paginate(:page => params[:page])
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
    @list.items.build
  end

  def edit
    @list = List.find(params[:id])
  end

  def create
    @list = List.new(params[:list])
    @list.user = current_user

    if(@list.save)
      respond_with @list
    else
      render :action => "new"
    end
  end

  def update
    @list = List.find(params[:id])

    if(@list.update_attributes(params[:list]))
      respond_with @list
    else
      render :action => "edit"
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy

    respond_with @list do |format|
      format.html { redirect_to root_path }
    end
  end
end
