class AddDeckStuffToCards < ActiveRecord::Migration
  def change
    add_column :cards, :deck_id, :integer
    add_column :cards, :sideboard, :boolean
  end
end
