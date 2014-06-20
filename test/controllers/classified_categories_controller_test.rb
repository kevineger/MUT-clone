require 'test_helper'

class ClassifiedCategoriesControllerTest < ActionController::TestCase
  setup do
    @classified_category = classified_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:classified_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create classified_category" do
    assert_difference('ClassifiedCategory.count') do
      post :create, classified_category: {  }
    end

    assert_redirected_to classified_category_path(assigns(:classified_category))
  end

  test "should show classified_category" do
    get :show, id: @classified_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @classified_category
    assert_response :success
  end

  test "should update classified_category" do
    patch :update, id: @classified_category, classified_category: {  }
    assert_redirected_to classified_category_path(assigns(:classified_category))
  end

  test "should destroy classified_category" do
    assert_difference('ClassifiedCategory.count', -1) do
      delete :destroy, id: @classified_category
    end

    assert_redirected_to classified_categories_path
  end
end
