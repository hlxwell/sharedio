require 'test_helper'

class FriendsControllerTest < ActionController::TestCase
  context "friends controller" do
    setup do
      @user = Factory(:user)
      sign_in :user, @user
    end

    should "be able to create" do
      friend = Factory.build(:friend)
      post :create, :friend => {:name => "xxx", :email => "xxx@xxx.com"}, :format => :json
      assert_response :created
      @user.reload
      assert_equal 1, @user.friends.count
    end

    should "be able to delete" do
      friend = Factory(:friend, :user => @user)
      post :destroy, :id => friend.id, :format => :json
      assert_response :ok
    end

    should "be able to update" do
      friend = Factory(:friend, :user => @user)
      delete :update, :friend => friend.attributes, :id => friend.id, :format => :json
      assert_response :ok
    end
  end

end
