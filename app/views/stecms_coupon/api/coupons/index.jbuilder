json.coupons @coupons do |coupon|
  json.identifier coupon.identifier
  json.description coupon.promo&.description
  json.cover coupon.promo.cover.full_url rescue nil
  json.stecms_coupon_promo_id coupon.stecms_coupon_promo_id
  json.valid_from coupon.valid_from
  json.valid_until coupon.valid_until
  json.promo coupon.promo.try(:name)
  json.status StecmsCoupon::Coupon.check_valid_and_active(coupon.identifier, params[:device])
end