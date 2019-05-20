class StecmsCoupon::SurveyQuestionPolicy < StecmsCouponPolicy
  def create?
    user.can(:create_survey_form_questions)
  end

  def edit?
    create?
  end

  def destroy?
    user.can(:delete_survey_form_questions)
  end
end
