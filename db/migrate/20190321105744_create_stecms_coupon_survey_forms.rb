class CreateStecmsCouponSurveyForms < ActiveRecord::Migration
  def change
    create_table :stecms_coupon_survey_forms do |t|
      t.string :name
      t.text :description
      t.references :stecms_coupon_promo

      t.timestamps null: false
    end
  end
end
