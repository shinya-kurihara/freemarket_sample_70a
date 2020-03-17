class ItemsController < ApplicationController
  before_action :set_item, only: [:show]

  def index
    @items = Item.includes(:item_images).order("created_at DESC")
  end

  def show
    @item_images = @item.item_images
  end

private

  def set_item
    @item = Item.find(params[:id])
  end

end