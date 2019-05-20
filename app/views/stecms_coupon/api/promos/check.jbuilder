json.promo @promo[:obj]
json.status @promo[:status]
json.message @promo[:message]

if @coupon
	json.coupon @coupon
end

if @promo[:obj]
	if @promo[:status] and @promo[:obj].answer
		survey_obj = @promo[:obj].survey
		if survey_obj
			json.survey do 
				json.name survey_obj.name
				json.description survey_obj.description
				json.questions survey_obj.questions, :id, :question, :input_type, :input_options, :input_placeholder, :input_label, :input_required
			end
		end
	end
end