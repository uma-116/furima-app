class AddShipMethodToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :ship_method, :string
  end
end
