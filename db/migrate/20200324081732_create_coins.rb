class CreateCoins < ActiveRecord::Migration[5.2]
  def change
    create_table :coins do |t|
      t.integer :value, null: false
      t.string :name, null: false, unique: true
      t.integer :created_by, null: false, foreign_key: true
      t.timestamps
    end
  end
end
