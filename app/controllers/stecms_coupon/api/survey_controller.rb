module StecmsCoupon
	module Api
	  class SurveyController < ApiController

	  	def submit_answer
	  		@coupon = nil
	  		@promo = ::StecmsCoupon::Promo.check_valid_and_active(params[:identifier])

	  		check_coupon_num = ::StecmsCoupon::Coupon.where(stecms_coupon_promo_id: @promo[:obj].id, device: params[:device]).count
  			if check_coupon_num > 0
  				if check_coupon_num >= @promo[:obj].usage_time_per_device
	  				@promo[:status] = false
  					@promo[:message] = 'Coupon for this promo already generated for this device'
  				end
  			end
	  		
	  		if @promo[:status]
	  			answer_ids = ::StecmsCoupon::SurveyAnswer.process_answer(params[:survey], @promo[:obj])
	  			@coupon = ::StecmsCoupon::Coupon.generate_coupon(@promo[:obj], params[:device])
	  			if @coupon 
	  				::StecmsCoupon::SurveyAnswer.set_coupon_on_answer(answer_ids, @coupon)
	  			end
	  		end

	  	end

  	end
  end
end