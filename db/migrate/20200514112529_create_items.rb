class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string  :name,      null:false
      t.text    :detail,    null:false
      t.string  :condition, null:false
      t.integer :price,     null:false
      t.string  :postage,   null:false
      t.string  :ship_from, null:false
      t.string  :ship_date, null:false
      t.string  :brand

      # 外部キーになる
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true
      t.timestamps
    end
  end
end
