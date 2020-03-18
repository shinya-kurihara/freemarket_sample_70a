class ItemsController < ApplicationController
  before_action :set_item, only: [:show]

  def index
    @items = Item.includes(:item_images).order("created_at DESC")
    @parents = Category.where(ancestry: nil)
  end

  def new
    @item = Item.new
    @item.item_images.new
    #セレクトボックスの初期値設定
    @category_parent_array = ["---"]
    #データベースから、親カテゴリーのみ抽出し、配列化
    Category.where(ancestry: nil).each do |parent|
       @category_parent_array << parent.name
    end
  end

  def create
    @item = Item.new(item_params)
    @item.update(seller_id: current_user.id)
    # binding.pry
    if @item.save
      redirect_to root_path
    else
      #セレクトボックスの初期値設定
      @category_parent_array = ["---"]
      #データベースから、親カテゴリーのみ抽出し、配列化
      Category.where(ancestry: nil).each do |parent|
        @category_parent_array << parent.name
      end
      redirect_to new_item_path

    end
  end

  def show
    @item_images = @item.item_images
  end

  # 以下全て、formatはjsonのみ
  # 親カテゴリーが選択された後に動くアクション
  def get_category_children
  #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
  #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def set_parents
    @parents = Category.where(ancestry: nil)
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :item_description, :category_id, :buyer_id, :seller_id, item_images_attributes:  [:image])
  end

  def set_item
    @item = Item.find(params[:id])
  end

end