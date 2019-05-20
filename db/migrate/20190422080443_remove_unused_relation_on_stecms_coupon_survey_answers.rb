class RemoveUnusedRelationOnStecmsCouponSurveyAnswers < ActiveRecord::Migration
  def change
  	remove_reference :stecms_coupon_survey_answers, :stecms_coupon_coupon
  end
end
