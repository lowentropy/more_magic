class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string :name
      t.references :collection

      t.timestamps
    end
    add_index :decks, :collection_id
  end
end
