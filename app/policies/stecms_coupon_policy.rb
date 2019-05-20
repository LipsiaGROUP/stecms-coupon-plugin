class StecmsCouponPolicy < AdminPolicy
  
  protected
    def coupons_enabled?
      LipsiaWEB[:modules][:promos]
    end
end