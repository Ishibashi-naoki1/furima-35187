class CreateShipDates < ActiveRecord::Migration[6.0]
  def change
    create_table :ship_dates do |t|
      t.string     :title        , null: false
      t.text       :text         , null: false
      t.integer    :ship_date_id     , null: false
      t.timestamps
    end
  end
end
