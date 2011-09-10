class RemoveDeckStuffFromCards < ActiveRecord::Migration
  def change
    change_table :cards do |t|
      t.remove :deck_id
      t.remove :sideboard
    end
  end
end
