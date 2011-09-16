class AddCountToCopies < ActiveRecord::Migration
  def change
    add_column :copies, :count, :integer
  end
end
