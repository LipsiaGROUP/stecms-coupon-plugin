require_dependency "stecms_coupon/application_controller"

module StecmsCoupon
  class CouponsController < BackendController
    before_action :set_coupon, only: [:show, :edit, :update, :destroy]
    before_action :set_active_page

    # GET /coupons
    def index
      authorize ::StecmsCoupon::Coupon
      @collection = ::StecmsCoupon::Coupon.all
    end

    # GET /coupons/1
    def show
    end

    # GET /coupons/new
    def new
      @coupon = ::StecmsCoupon::Coupon.new
      authorize @coupon
    end

    # GET /coupons/1/edit
    def edit
    end

    # POST /coupons
    def create
      @coupon = ::StecmsCoupon::Coupon.new(coupon_params)
      authorize @coupon

      if @coupon.save
        redirect_to edit_coupon_url(@coupon), notice: 'Coupon was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /coupons/1
    def update
      if @coupon.update(coupon_params)
        redirect_to edit_coupon_url(@coupon), notice: 'Coupon was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /coupons/1
    def destroy
      @coupon.destroy
      #redirect_to coupons_url, notice: 'Coupon was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_coupon
        @coupon = ::StecmsCoupon::Coupon.find(params[:id])
        authorize @coupon
      end

      # Only allow a trusted parameter "white list" through.
      def coupon_params
        params.require(:coupon).permit(:stecms_coupon_promo_id, :identifier, :device, :max_usage_times, :usage_times, :active, :valid_from, :valid_until, :generated_at)
      end

      def set_active_page
        @side_menu ||= "stecms_coupon"
      end
  end
end
