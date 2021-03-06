class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :item_name         , null: false
      t.integer    :price             , null: false
      t.text       :condition         , null: false
      t.integer    :category_id       , null: false
      t.integer    :brand_id          , null: false
      t.integer    :carriage_id       , null: false
      t.integer    :prefecture_id     , null: false
      t.integer    :ship_date_id      , foreign_key: true
      t.references :user              , foreign_key: true
      t.timestamps
    end
  end
end
