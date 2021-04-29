class CreateBrands < ActiveRecord::Migration[6.0]
  def change
    create_table :brands do |t|
      t.string     :title        , null: false
      t.text       :text         , null: false
      t.integer    :brands_id     , null: false
      t.timestamps
    end
  end
end
