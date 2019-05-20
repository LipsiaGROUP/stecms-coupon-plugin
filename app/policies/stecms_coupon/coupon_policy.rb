class StecmsCoupon::CouponPolicy < StecmsCouponPolicy
  def index?
    user.can(:see_coupons)
  end

  def new?
    user.can(:create_coupons)
  end

  def create?
    new?
  end

  def edit?
    user.can(:manage_coupons)
  end

  def update?
    edit?
  end

  def show?
    index?
  end

  def destroy?
    user.can(:destroy_coupons)
  end

end