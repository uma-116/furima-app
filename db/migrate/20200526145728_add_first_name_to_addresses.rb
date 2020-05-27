class AddFirstNameToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :firstname, :string, null: false
  end
end
