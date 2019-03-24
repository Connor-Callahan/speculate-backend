class CreateCharts < ActiveRecord::Migration[5.2]
  def change
    create_table :charts do |t|
      t.belongs_to :user, foreign_key: true
      t.integer :balance
      t.string :date_time

      t.timestamps
    end
  end
end
