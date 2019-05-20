require_dependency "stecms_coupon/application_controller"

module StecmsCoupon
  class SurveyFormsController < BackendController
    before_action :set_promo
    before_action :set_survey_form, only: [:show, :edit, :update, :destroy]
    before_action :set_active_page

    # GET /survey_forms
    # def index
    #   authorize ::StecmsCoupon::SurveyForm
    #   @collection = ::StecmsCoupon::SurveyForm.all
    # end

    # GET /survey_forms/1
    def show
    end

    # GET /survey_forms/new
    def new
      redirect_to edit_promo_survey_form_url(@promo, @promo.survey) and return if @promo.survey.present?
      @survey_form = ::StecmsCoupon::SurveyForm.new(stecms_coupon_promo_id: params[:promo_id])
      authorize @survey_form
    end

    # GET /survey_forms/1/edit
    def edit
    end

    # POST /survey_forms
    def create
      @survey_form = ::StecmsCoupon::SurveyForm.new(survey_form_params)
      authorize @survey_form

      if @survey_form.save
        redirect_to edit_promo_survey_form_url(@promo, @survey_form), notice: 'survey_form was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /survey_forms/1
    def update
      if @survey_form.update(survey_form_params)
        redirect_to edit_promo_survey_form_url(@promo, @survey_form), notice: 'survey_form was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /survey_forms/1
    def destroy
      @survey_form.destroy
      redirect_to survey_forms_url, notice: 'survey_form was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_survey_form
        @survey_form = ::StecmsCoupon::SurveyForm.find(params[:id])
        authorize @survey_form
      end

      def set_promo
        @promo = ::StecmsCoupon::Promo.find(params[:promo_id])
      end

      # Only allow a trusted parameter "white list" through.
      def survey_form_params
        params.require(:survey_form).permit(:name, :description, :stecms_coupon_promo_id,
          questions_attributes: [:id, :question, :input_type, :input_options, :input_placeholder, :input_label, :input_required, :_destroy])
      end

      def set_active_page
        @side_menu ||= "stecms_promo"
      end
  end
end
