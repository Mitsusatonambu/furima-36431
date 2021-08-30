class RemoveDeliveryFeeIdFromOrders < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :delivery_fee_id, :integer
  end
end
