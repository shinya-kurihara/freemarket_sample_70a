class BuyController < ApplicationController
  require 'payjp'
  before_action :set_card, :set_item

  def index
    if @card.blank?
      redirect_to controller: "credit_cards", action: "new"
    else
      Payjp.api_key = "sk_test_fa6fe4bc92f74e28b16adf2c"
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def pay
    Payjp.api_key = 'sk_test_fa6fe4bc92f74e28b16adf2c'
    Payjp::Charge.create(
      amount: @item.price,
      customer: @card.customer_id,
      currency: 'jpy',
    )
    @item_buyer = Item.find(params[:item_id])
    @item_buyer.update!( buyer_id: current_user.id)
    redirect_to root_path
  end

  private

  def set_card
    @card = CreditCard.where(user_id: current_user).first
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
