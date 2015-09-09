class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.belongs_to :spell
      t.string :name
      t.integer :quantity, null: false, default: 1

      t.timestamps null: false
    end

    add_index :ingredients, :spell_id
  end
end
