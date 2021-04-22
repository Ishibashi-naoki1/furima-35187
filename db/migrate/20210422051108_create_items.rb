class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :item_name   , null: false
      t.integer    :price       , null: false
      t.integer    :Seller      , null: false
      t.integer    :condition   , null: false
      t.integer    :category    , null: false
      t.integer    :carriage    , null: false
      t.integer    :origin_ship , null: false
      t.integer    :ship_date   , null: false
      t.integer    :carriage    , null: false
      t.references :user        , foreign_key: true
      t.timestamps
    end
  end
end
