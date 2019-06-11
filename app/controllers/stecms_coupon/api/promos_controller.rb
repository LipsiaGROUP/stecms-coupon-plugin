module StecmsCoupon
  module Api
    class PromosController < ApiController
      include Rosebud

      def index
        @promos = ::StecmsCoupon::Promo.active.visible.not_expired
      end

      params :detail do
        requires :identifier
      end

      def detail
        @promo = ::StecmsCoupon::Promo.active.where(identifier: params[:identifier]).last                       
      end

      params :check do
        requires :identifier
        requires :device
      end

      def check
        @coupon = nil
        @promo  = ::StecmsCoupon::Promo.check_valid_and_active(params[:identifier])

        check_coupon_num = ::StecmsCoupon::Coupon.where(stecms_coupon_promo_id: @promo[:obj].id, device: params[:device]).count
        if check_coupon_num > 0
          if check_coupon_num >= @promo[:obj].usage_time_per_device
            @promo[:status]  = false
            @promo[:message] = I18n.t("admin.promo.status.coupon_already_generated")
          end
        end

        ## generate coupon when no survey
        unless @promo[:obj].answer
          if @promo[:status]
            @coupon = ::StecmsCoupon::Coupon.generate_coupon(@promo[:obj], params[:device])
            @promo[:message] = I18n.t("admin.promo.status.coupon_added")
          end
        end
      end

    end
  end
end
