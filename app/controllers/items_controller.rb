class ItemsController < ApplicationController

  def create
    @item = Item.new(item_params)
    @item.user = current_user

    if @item.save
      flash[:notice] = "A new item has been added to your list."
      redirect_to user_path(current_user)
    else
      errors = ""
      @item.errors.full_messages.each do |msg|
        errors = "<li>#{msg}</li>" + errors
      end
      flash[:error] = "There was an error adding your item. Please try again! <ul>#{errors}<ul>"
      redirect_to user_path(current_user)
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)   
  end 
end
