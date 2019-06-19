class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string, :address
      t.string, :phone_number
      t.string, :full_name
      t.integer :status

      t.timestamps
    end
  end
end
