class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :activity
      t.references :user
      t.integer :quantity
    end
  end
end
