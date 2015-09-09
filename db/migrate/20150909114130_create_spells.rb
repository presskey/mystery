class CreateSpells < ActiveRecord::Migration
  def change
    create_table :spells do |t|
      t.belongs_to :user
      t.string :name
      t.text :description

      t.timestamps null: false
    end

    add_index :spells, :user_id
  end
end
