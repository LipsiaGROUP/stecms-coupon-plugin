class StecmsCoupon::SurveyAnswer < ActiveRecord::Base

	belongs_to :question, class_name: 'StecmsCoupon::SurveyQuestion'

	def self.process_answer(answer, promo)
		answer_data = []
		question_collection = promo.survey.questions
		answer.each do |item, value|
			question = question_collection.detect { |q| q.question.eql?(item) }
			answer_data << StecmsCoupon::SurveyAnswer.new(answer: value, 
				stecms_coupon_survey_question_id: question.id)
		end

		answer_data.map(&:save)
		return answer_data.map(&:id)
	end

	def self.set_coupon_on_answer(ids, coupon)
		StecmsCoupon::SurveyAnswer.where(id: ids).update_all(stecms_coupon_coupon_id: coupon.id)
	end

end
