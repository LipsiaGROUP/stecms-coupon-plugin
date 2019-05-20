class CreateStecmsCouponPromos < ActiveRecord::Migration
  def change
    create_table :stecms_coupon_promos do |t|
      t.string :name
      t.string :identifier
      t.boolean :answer, default: false
      t.integer :usage_time_per_device, default: 0
      t.datetime :valid_from
      t.datetime :valid_until
      t.boolean :active, default: true

      t.timestamps null: false
    end
  end
end
