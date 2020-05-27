class AddLastNameKanaToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :lastname_kana, :string, null: false
  end
end
