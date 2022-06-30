class ItemsController < ApplicationController

  def index
    if params[:user_id]
      user = User.find(params[:user_id])
      render json: user.items
    else
      items = Item.all
      render json: items, include: :user
    end
  end

  def show
    render json: Item.find(params[:id])
  end

  def create
    user = User.find(params[:user_id])
    new_item = user.items.create(item_params)
    render json: new_item, status: :created
  end

  private

  def item_params
    params.permit(:name, :description, :price)
  end

end
