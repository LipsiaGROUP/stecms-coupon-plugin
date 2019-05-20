require_dependency "stecms_coupon/application_controller"

module StecmsCoupon
  class PromosController < BackendController
    before_action :set_promo, only: [:show, :edit, :update, :destroy]
    before_action :set_active_page

    # GET /promos
    def index
      authorize ::StecmsCoupon::Promo
      @collection = ::StecmsCoupon::Promo.all
    end

    # GET /promos/1
    def show
      respond_to do |format|
        format.html
        format.js
      end
    end

    # GET /promos/new
    def new
      @promo = ::StecmsCoupon::Promo.new
      authorize @promo
    end

    # GET /promos/1/edit
    def edit
    end

    # POST /promos
    def create
      @promo = ::StecmsCoupon::Promo.new(promo_params)
      authorize @promo

      if @promo.save
        redirect_to({action: :edit, id: @promo.id}, notice: 'Promo was successfully created.')
      else
        render :new
      end
    end

    # PATCH/PUT /promos/1
    def update
      if @promo.update(promo_params)
        redirect_to({action: :edit, id: @promo.id}, notice: 'Promo was successfully updated.')
      else
        render :edit
      end
    end

    # DELETE /promos/1
    def destroy
      @promo.destroy

      respond_to do |format|
        format.html do
          redirect_to promos_url, notice: 'Promo was successfully destroyed.'
        end
        format.js
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_promo
        @promo = ::StecmsCoupon::Promo.find(params[:id])
        authorize @promo
      end

      # Only allow a trusted parameter "white list" through.
      def promo_params
        params.require(:promo).permit(:usage_coupon_times, :name, :identifier, :answer, :usage_time_per_device, :valid_from, :valid_until, :active, :cover, :description)
      end

      def set_active_page
        @side_menu ||= "stecms_promo"
      end
  end
end
