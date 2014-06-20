require 'test_helper'

class TesticlesControllerTest < ActionController::TestCase
  setup do
    @testicle = testicles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:testicles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create testicle" do
    assert_difference('Testicle.count') do
      post :create, testicle: { size: @testicle.size }
    end

    assert_redirected_to testicle_path(assigns(:testicle))
  end

  test "should show testicle" do
    get :show, id: @testicle
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @testicle
    assert_response :success
  end

  test "should update testicle" do
    patch :update, id: @testicle, testicle: { size: @testicle.size }
    assert_redirected_to testicle_path(assigns(:testicle))
  end

  test "should destroy testicle" do
    assert_difference('Testicle.count', -1) do
      delete :destroy, id: @testicle
    end

    assert_redirected_to testicles_path
  end
end
