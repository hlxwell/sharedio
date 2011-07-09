require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  setup do
    @user = Factory(:user)
  end

  test "has many friends" do
    friend = Factory(:friend, :user => @user)
    group = Factory(:group, :user => @user)
    group.friends << friend
    assert_equal 1, friend.groups.count
  end
end
