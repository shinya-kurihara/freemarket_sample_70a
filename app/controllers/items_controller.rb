class ItemsController < ApplicationController

  def new
    @item = Item.new
    @item.item_images.new
  end

  def create
    @item = Item.new(item_params)
    @item.update(seller_id: current_user.id)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_update_params)
  end

  private
  def item_params
    params.require(:item).permit(:id, :name, :price, :item_description, :category, :buyer_id, :seller_id, :created_at, :updated_at, :item_image_id,item_images_attributes: [:image])
  end

  def item_update_params
    params.require(:item).permit(
      :name,
      [images_attributes: [:image, :_destroy, :id]])
  end

end