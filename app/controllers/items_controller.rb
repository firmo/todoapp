class ItemsController < ApplicationController
  before_filter :find_list

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
  end

  protected

  def find_list
    @list = List.find(params[:list_id])
  end
end
