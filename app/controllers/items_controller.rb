class ItemsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    @item = Item.new(item_params)
    @item.user = current_user
    @new_item = Item.new 

    if @item.save
      flash[:notice] = "A new item has been added to your list."
      # redirect_to user_path(current_user)
    else
      errors = ""
      @item.errors.full_messages.each do |msg|
        errors = "<li>#{msg}</li>" + errors
      end
      flash[:error] = "There was an error adding your item. Please try again! <ul>#{errors}<ul>"
      # redirect_to user_path(current_user)
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @item = Item.find(params[:id])

    if @item.destroy
      flash[:notice] = "Item has been marked as completed and deleted"
      # redirect_to user_path(@item.user)
    else
      flash[:error] = "There was an error. Please try again."
      # reidrect_to user_path(@item.user)
    end
    
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)   
  end 
end