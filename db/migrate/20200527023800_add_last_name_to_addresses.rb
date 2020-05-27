class AddLastNameToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :lastname, :string, null: false
  end
end
