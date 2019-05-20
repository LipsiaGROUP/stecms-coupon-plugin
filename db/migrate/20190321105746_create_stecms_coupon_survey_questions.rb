class CreateStecmsCouponSurveyQuestions < ActiveRecord::Migration
  def change
    create_table :stecms_coupon_survey_questions do |t|
    	t.references :stecms_coupon_survey_form
    	t.text :question 
      t.string :input_type, default: 'text' # email, date, number dll
      t.text :input_options # for store checkbox and select dropdown option
    	t.string :input_placeholder
      t.string :input_label
      t.boolean :input_required, default: false

      t.timestamps null: false
    end
  end
end
