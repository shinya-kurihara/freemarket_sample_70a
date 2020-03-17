class ItemsController < ApplicationController
  before_action :set_item, only: [:show]

  def index
    @items = Item.all.order("created_at DESC")
    @item_images = ItemImage.all
  end

  def show
    @item = Item.find(params[:id])
    @item_images = @item.item_images
  end

private

  def set_item
    @item = Item.find(params[:id])
  end

end