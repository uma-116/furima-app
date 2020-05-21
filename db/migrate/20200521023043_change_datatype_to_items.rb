class ChangeDatatypeToItems < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :condition, :integer, null:false
    change_column :items, :ship_from, :integer, null:false
    change_column :items, :ship_date, :integer, null:false
    change_column :items, :postage, :integer, null:false
  end
end