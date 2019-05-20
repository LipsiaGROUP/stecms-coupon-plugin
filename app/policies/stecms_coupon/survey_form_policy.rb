class StecmsCoupon::SurveyFormPolicy < StecmsCouponPolicy
  def index?
    user.can(:see_survey_forms)
  end

  def new?
    user.can(:create_survey_forms)
  end

  def create?
    new?
  end

  def edit?
    user.can(:manage_survey_forms)
  end

  def update?
    edit?
  end

  def show?
    index?
  end

  def destroy?
    user.can(:destroy_survey_forms)
  end
end