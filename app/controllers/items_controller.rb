class ItemsController < ApplicationController
  def index
    @items = Item.all.order("created_at DESC")
    @item_images = ItemImage.all
  end
end
