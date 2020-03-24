class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :transaction_type, null: false
      t.integer :user_id, null: false, foreign_key: true
      t.integer :coin_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
