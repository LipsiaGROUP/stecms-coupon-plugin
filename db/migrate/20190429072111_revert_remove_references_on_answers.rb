class RevertRemoveReferencesOnAnswers < ActiveRecord::Migration
  def change
  	add_reference :stecms_coupon_survey_answers, :stecms_coupon_coupon
  end
end
