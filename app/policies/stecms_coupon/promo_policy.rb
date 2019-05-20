class StecmsCoupon::PromoPolicy < StecmsCouponPolicy
  def index?
    user.can(:see_promos)
  end

  def new?
    user.can(:create_promos)
  end

  def create?
    new?
  end

  def edit?
    user.can(:manage_promos)
  end

  def update?
    edit?
  end

  def show?
    index?
  end

  def destroy?
    user.can(:destroy_promos)
  end
end