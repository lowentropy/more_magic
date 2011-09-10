class AddSleeveColorToDecks < ActiveRecord::Migration
  def change
    add_column :decks, :sleeve_color, :string
  end
end
