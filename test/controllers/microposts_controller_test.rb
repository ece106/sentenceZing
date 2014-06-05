require 'test_helper'

class MicropostsControllerTest < ActionController::TestCase
  setup do
    @micropost = microposts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:microposts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create micropost" do
    assert_difference('Micropost.count') do
      post :create, micropost: { STORY: @micropost.STORY, sent10: @micropost.sent10, sent11: @micropost.sent11, sent12: @micropost.sent12, sent1: @micropost.sent1, sent2: @micropost.sent2, sent3: @micropost.sent3, sent4: @micropost.sent4, sent5: @micropost.sent5, sent6: @micropost.sent6, sent7: @micropost.sent7, sent8: @micropost.sent8, sent9: @micropost.sent9 }
    end

    assert_redirected_to micropost_path(assigns(:micropost))
  end

  test "should show micropost" do
    get :show, id: @micropost
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @micropost
    assert_response :success
  end

  test "should update micropost" do
    patch :update, id: @micropost, micropost: { STORY: @micropost.STORY, sent10: @micropost.sent10, sent11: @micropost.sent11, sent12: @micropost.sent12, sent1: @micropost.sent1, sent2: @micropost.sent2, sent3: @micropost.sent3, sent4: @micropost.sent4, sent5: @micropost.sent5, sent6: @micropost.sent6, sent7: @micropost.sent7, sent8: @micropost.sent8, sent9: @micropost.sent9 }
    assert_redirected_to micropost_path(assigns(:micropost))
  end

  test "should destroy micropost" do
    assert_difference('Micropost.count', -1) do
      delete :destroy, id: @micropost
    end

    assert_redirected_to microposts_path
  end
end
