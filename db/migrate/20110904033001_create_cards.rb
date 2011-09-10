class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :num
      t.string :name
      t.string :card_type
      t.string :mana
      t.string :rarity
      t.string :artist
      t.references :card_set
      t.text :description

      t.timestamps
    end
    add_index :cards, :card_set_id
  end
end
