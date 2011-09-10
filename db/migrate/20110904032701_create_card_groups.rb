class CreateCardGroups < ActiveRecord::Migration
  def change
    create_table :card_groups do |t|
      t.string :name

      t.timestamps
    end
  end
end
