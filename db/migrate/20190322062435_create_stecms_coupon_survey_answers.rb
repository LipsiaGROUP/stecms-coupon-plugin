class CreateStecmsCouponSurveyAnswers < ActiveRecord::Migration
  def change
    create_table :stecms_coupon_survey_answers do |t|
      t.text :answer
      t.references :stecms_coupon_survey_question
      t.references :stecms_coupon_coupon
      t.timestamps null: false
    end
  end
end
