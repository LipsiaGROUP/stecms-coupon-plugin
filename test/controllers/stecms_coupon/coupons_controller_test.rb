require 'test_helper'

module StecmsCoupon
  class CouponsControllerTest < ActionController::TestCase
    setup do
      @coupon = stecms_coupon_coupons(:one)
      @routes = Engine.routes
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:coupons)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create coupon" do
      assert_difference('Coupon.count') do
        post :create, coupon: { active: @coupon.active, device: @coupon.device, generated_at: @coupon.generated_at, identifier: @coupon.identifier, max_usage_times: @coupon.max_usage_times, usage_times: @coupon.usage_times, valid_from: @coupon.valid_from, valid_until: @coupon.valid_until }
      end

      assert_redirected_to coupon_path(assigns(:coupon))
    end

    test "should show coupon" do
      get :show, id: @coupon
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @coupon
      assert_response :success
    end

    test "should update coupon" do
      patch :update, id: @coupon, coupon: { active: @coupon.active, device: @coupon.device, generated_at: @coupon.generated_at, identifier: @coupon.identifier, max_usage_times: @coupon.max_usage_times, usage_times: @coupon.usage_times, valid_from: @coupon.valid_from, valid_until: @coupon.valid_until }
      assert_redirected_to coupon_path(assigns(:coupon))
    end

    test "should destroy coupon" do
      assert_difference('Coupon.count', -1) do
        delete :destroy, id: @coupon
      end

      assert_redirected_to coupons_path
    end
  end
end
