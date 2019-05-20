require_dependency "stecms_coupon/application_controller"

module StecmsCoupon
  class SurveyQuestionsController < BackendController
    before_action :set_survey_form

    def create
      @survey_question = @survey_form.questions.build
      authorize @survey_question
      @survey_question.save
    end

    def edit
      @survey_question = @survey_form.questions.find(params[:id])
      authorize @survey_question
    end

    def destroy
      @survey_question = @survey_form.questions.find(params[:id])
      authorize @survey_question
      @survey_question.destroy    
    end

    private
      def set_survey_form
        @survey_form = ::StecmsCoupon::SurveyForm.find(params[:survey_form_id])
      end
  end
end
