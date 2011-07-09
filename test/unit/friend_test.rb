require 'test_helper'

class FriendTest < ActiveSupport::TestCase
  setup do
    @user = Factory(:user)
  end

  test "has many groups" do
    friend = Factory(:friend, :user => @user)
    group = Factory(:group, :user => @user)
    friend.groups << group
    assert_equal 1, group.friends.count
  end
end
