module StecmsCoupon
	module Api
	  class PromosController < ApiController
	  	include Rosebud

	  	params :detail do
	  		requires :identifier
	  	end

	  	def detail
	  		@promo = ::StecmsCoupon::Promo.where(identifier: params[:identifier]).last
	  	end

	  	params :check do
		    requires :identifier
		    requires :device
		  end

	  	def check
	  		@coupon = nil
	  		@promo = ::StecmsCoupon::Promo.check_valid_and_active(params[:identifier])

	  		check_coupon_num = ::StecmsCoupon::Coupon.where(stecms_coupon_promo_id: @promo[:obj].id, device: params[:device]).count
  			if check_coupon_num > 0
  				if check_coupon_num >= @promo[:obj].usage_time_per_device
	  				@promo[:status] = false
  					@promo[:message] = 'Coupon for this promo already generated for this device'
  				end
  			end
	  		
	  		## generate coupon when no survey
	  		unless @promo[:obj].answer
	  			if @promo[:status]
		  			@coupon = ::StecmsCoupon::Coupon.generate_coupon(@promo[:obj], params[:device])
		  		end
	  		end
	  	end

  	end
  end
end