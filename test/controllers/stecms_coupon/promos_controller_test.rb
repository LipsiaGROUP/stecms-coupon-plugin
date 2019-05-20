require 'test_helper'

module StecmsCoupon
  class PromosControllerTest < ActionController::TestCase
    setup do
      @promo = stecms_coupon_promos(:one)
      @routes = Engine.routes
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:promos)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create promo" do
      assert_difference('Promo.count') do
        post :create, promo: { active: @promo.active, answer: @promo.answer, identifier: @promo.identifier, name: @promo.name, usage_time_per_device: @promo.usage_time_per_device, valid_from: @promo.valid_from, valid_until: @promo.valid_until }
      end

      assert_redirected_to promo_path(assigns(:promo))
    end

    test "should show promo" do
      get :show, id: @promo
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @promo
      assert_response :success
    end

    test "should update promo" do
      patch :update, id: @promo, promo: { active: @promo.active, answer: @promo.answer, identifier: @promo.identifier, name: @promo.name, usage_time_per_device: @promo.usage_time_per_device, valid_from: @promo.valid_from, valid_until: @promo.valid_until }
      assert_redirected_to promo_path(assigns(:promo))
    end

    test "should destroy promo" do
      assert_difference('Promo.count', -1) do
        delete :destroy, id: @promo
      end

      assert_redirected_to promos_path
    end
  end
end
