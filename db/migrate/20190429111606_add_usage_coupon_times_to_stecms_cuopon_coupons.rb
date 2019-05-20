class AddUsageCouponTimesToStecmsCuoponCoupons < ActiveRecord::Migration
  def change
    add_column :stecms_coupon_promos, :usage_coupon_times, :integer, null: false, default: 1
  end
end
