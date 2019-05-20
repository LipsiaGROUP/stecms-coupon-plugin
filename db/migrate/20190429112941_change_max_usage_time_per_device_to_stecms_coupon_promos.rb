class ChangeMaxUsageTimePerDeviceToStecmsCouponPromos < ActiveRecord::Migration
  def change
    change_column_default :stecms_coupon_promos, :usage_time_per_device, 1
  end
end
