module StecmsCoupon
  module Api
    class CouponsController < ApiController
      include Rosebud      

      params :index do
        requires :device
      end

      def index
        @coupons = ::StecmsCoupon::Coupon.includes(:promo).where(device: params[:device])
      end

      params :use do
        requires :identifier
        requires :device
      end

      def use
        @coupon = ::StecmsCoupon::Coupon.check_valid_and_active(params[:identifier], params[:device])

        ## if true,, update the usage time
        if @coupon[:status]
          @coupon[:obj].update_usage_coupon
        end
      end

      params :show do
        requires :id
      end

      def show
        @coupon = ::StecmsCoupon::Coupon.find(params[:id])
      end

    end
  end
end
