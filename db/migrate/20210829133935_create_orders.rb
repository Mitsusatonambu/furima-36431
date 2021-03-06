class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references     :user,              null: false, foreign_key: true
      t.references     :item,              null: false, foreign_key: true
      t.integer        :delivery_fee_id,   null: false
      t.timestamps
    end
  end
end
