class CreateCarriages < ActiveRecord::Migration[6.0]
  def change
    create_table :carriages do |t|
      t.string     :title        , null: false
      t.text       :text         , null: false
      t.integer    :carriage_id     , null: false
      t.timestamps
    end
  end
end
