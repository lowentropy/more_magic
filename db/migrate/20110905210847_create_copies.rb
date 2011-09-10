class CreateCopies < ActiveRecord::Migration
  def change
    create_table :copies do |t|
      t.references :deck
      t.boolean :sideboard
      t.references :card

      t.timestamps
    end
    add_index :copies, :deck_id
    add_index :copies, :card_id
  end
end
