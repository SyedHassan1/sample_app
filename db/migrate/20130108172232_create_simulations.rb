class CreateSimulations < ActiveRecord::Migration
  def change
    create_table :simulations do |t|
      t.string :input
      t.string :output
      t.integer :user_id

      t.timestamps
    end
    add_index :simulations, [:user_id, :created_at]
  end
end
