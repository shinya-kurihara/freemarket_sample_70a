class ChangeDataPhoneNumberToSendingDestination < ActiveRecord::Migration[5.2]
  def change
    change_column :sending_destinations, :phone_number, :string
  end
end
