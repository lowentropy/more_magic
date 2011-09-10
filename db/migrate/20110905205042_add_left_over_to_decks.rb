class AddLeftOverToDecks < ActiveRecord::Migration
  def change
    add_column :decks, :left_over, :boolean, default: false
  end
end
