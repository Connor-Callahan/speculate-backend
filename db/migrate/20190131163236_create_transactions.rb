class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.belongs_to :user, foreign_key: true
      t.integer :num_shares
      t.float :price
      t.float :cost
      t.integer :commission
      t.string :order_type
      t.string :date_time

      t.timestamps
    end
  end
end
