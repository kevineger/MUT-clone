require 'test_helper'

class ClassifiedPostsControllerTest < ActionController::TestCase
  setup do
    @classified_post = classified_posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:classified_posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create classified_post" do
    assert_difference('ClassifiedPost.count') do
      post :create, classified_post: {  }
    end

    assert_redirected_to classified_post_path(assigns(:classified_post))
  end

  test "should show classified_post" do
    get :show, id: @classified_post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @classified_post
    assert_response :success
  end

  test "should update classified_post" do
    patch :update, id: @classified_post, classified_post: {  }
    assert_redirected_to classified_post_path(assigns(:classified_post))
  end

  test "should destroy classified_post" do
    assert_difference('ClassifiedPost.count', -1) do
      delete :destroy, id: @classified_post
    end

    assert_redirected_to classified_posts_path
  end
end
