class StecmsCoupon::SurveyQuestion < ActiveRecord::Base
  INPUT_TYPES = %w(text number date checkbox selectbox).freeze
  
  belongs_to :survey_form, class_name: 'StecmsCoupon::SurveyForm'
  has_many :survey_answers, class_name: 'StecmsCoupon::SurveyAnswer', foreign_key: 'stecms_coupon_survey_question_id'

  def answer_by_coupon(coupon)
  	self.survey_answers.where(stecms_coupon_coupon_id: coupon.id).last.try(:answer)
  end
  
end
