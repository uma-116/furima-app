class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null:false
      t.text :detail, null:false
      t.string :condition, null:false
      t.integer :price, null:false
      t.string :postage, null:false
      t.string :ship_from, null:false
      t.string :ship_date, null:false
      # 外部キー制約をするらしい
      t.integer :user_id, null:false, foreign_key: true
      t.integer :category_id, null:false, foreign_key: true
      t.integer :brand_id, foreign_key: true
      t.timestamps
      end
  end
end
