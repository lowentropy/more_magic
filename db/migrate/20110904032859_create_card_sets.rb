class CreateCardSets < ActiveRecord::Migration
  def change
    create_table :card_sets do |t|
      t.string :name
      t.references :card_group

      t.timestamps
    end
    add_index :card_sets, :card_group_id
  end
end
