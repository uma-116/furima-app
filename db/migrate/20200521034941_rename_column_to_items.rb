class RenameColumnToItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :condition, :condition_id
    rename_column :items, :ship_from, :prefecture_id
    rename_column :items, :ship_date, :shipping_id
    rename_column :items, :postage, :fee_id
  end
end