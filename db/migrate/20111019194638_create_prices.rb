class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.integer :card_id
      t.decimal :low, :precision => 7, :scale => 2
      t.decimal :mid, :precision => 7, :scale => 2
      t.decimal :high, :precision => 7, :scale => 2

      t.timestamps
    end
  end
end
