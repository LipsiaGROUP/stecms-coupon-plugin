class StecmsCoupon::SurveyForm < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  
  belongs_to :promo, class_name: 'StecmsCoupon::Promo'

  has_many :questions, :dependent => :destroy, class_name: 'StecmsCoupon::SurveyQuestion', foreign_key: :stecms_coupon_survey_form_id, inverse_of: :survey_form
  accepts_nested_attributes_for :questions, allow_destroy: true
end
