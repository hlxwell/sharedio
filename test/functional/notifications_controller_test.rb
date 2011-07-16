require 'test_helper'

class NotificationsControllerTest < ActionController::TestCase
  setup do
    @user = Factory(:user)
    @sharing = Factory(:sharing, :user => @user)
    @notification = @user.notifications.create! :sharing => @sharing
    sign_in @user
  end

  test "should get unviewed" do
    get :unviewed
    assert_response :success
    assert_equal 1, assigns(:notifications).size

    get :show, {:id => @notification.id}

    get :unviewed
    assert_equal 0, assigns(:notifications).size
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:notifications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create notification" do
    assert_difference('Notification.count') do
      post :create, :notification => { :user_id => @user, :sharing_id => @sharing }
    end

    assert_redirected_to notification_path(assigns(:notification))
  end

  test "should show notification" do
    get :show, :id => @notification.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @notification.to_param
    assert_response :success
  end

  test "should update notification" do
    put :update, :id => @notification.to_param, :notification => @notification.attributes
    assert_redirected_to notification_path(assigns(:notification))
  end

  test "should destroy notification" do
    assert_difference('Notification.count', -1) do
      delete :destroy, :id => @notification.to_param
    end

    assert_redirected_to notifications_path
  end
end
