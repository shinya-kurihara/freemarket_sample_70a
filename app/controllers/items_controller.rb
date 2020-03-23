class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :destroy]

  def index
    @items = Item.includes(:item_images).order("created_at DESC")
    @parents = Category.where(ancestry: nil)
  end

  def new
    @item = Item.new
    @item.item_images.new
    @category_parent_array = Category.where(ancestry: nil).pluck(:name)
  end

  def create
    @item = Item.new(item_params)
    @item.seller_id = current_user.id
    if @item.save
      redirect_to root_path
    else
      redirect_to new_item_path, flash: { error: @item.errors.full_messages }
    end
  end

  def show
    @item_images = @item.item_images
  end

  def destroy
    if @item.seller_id == current_user.id
      if @item.destroy
        redirect_to root_path
      else
        render "items/show"
      end
    end
  end

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def set_parents
    @parents = Category.where(ancestry: nil)
  end

  private

  def item_params
    params.require(:item).permit(:id, :name, :price, :item_description, :category_id, :seller_id, :created_at, :updated_at, :item_image_id, :brand_id, :item_condition_id, :postage_payer_id, :preparation_day_id, :prefecture_id, item_images_attributes: [:image])
  end

  def set_item
    @item = Item.find(params[:id])
  end

end