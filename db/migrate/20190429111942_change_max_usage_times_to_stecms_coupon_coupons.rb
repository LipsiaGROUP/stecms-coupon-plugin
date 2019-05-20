class ChangeMaxUsageTimesToStecmsCouponCoupons < ActiveRecord::Migration
  def change
    change_column_default :stecms_coupon_coupons, :max_usage_times, 1
  end
end
