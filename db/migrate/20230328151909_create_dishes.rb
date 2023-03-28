class CreateDishes < ActiveRecord::Migration[6.1]
  def change
    create_table :dishes do |t|
      t.string :title
      t.text :instructions
      t.integer :minutes_to_complete
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
