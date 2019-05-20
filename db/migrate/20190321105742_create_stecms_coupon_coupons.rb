class CreateStecmsCouponCoupons < ActiveRecord::Migration
  def change
    create_table :stecms_coupon_coupons do |t|
      t.string :identifier
      t.references :stecms_coupon_promo
      t.string :device
      t.integer :max_usage_times, default: 1
      t.integer :usage_times, default: 0
      t.boolean :active, default: true
      t.datetime :valid_from
      t.datetime :valid_until
      t.datetime :generated_at

      t.timestamps null: false
    end
  end
end
