require 'test_helper'

class Admin::ReviewsControllerTest < ActionController::TestCase
  setup do
    @admin_review = admin_reviews(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_reviews)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_review" do
    assert_difference('Admin::Review.count') do
      post :create, admin_review: {  }
    end

    assert_redirected_to admin_review_path(assigns(:admin_review))
  end

  test "should show admin_review" do
    get :show, id: @admin_review
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_review
    assert_response :success
  end

  test "should update admin_review" do
    patch :update, id: @admin_review, admin_review: {  }
    assert_redirected_to admin_review_path(assigns(:admin_review))
  end

  test "should destroy admin_review" do
    assert_difference('Admin::Review.count', -1) do
      delete :destroy, id: @admin_review
    end

    assert_redirected_to admin_reviews_path
  end
end
