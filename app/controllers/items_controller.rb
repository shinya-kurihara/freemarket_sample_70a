class ItemsController < ApplicationController
  def index
    @items = Item.includes(:item_images).order("created_at DESC")
  end
end
