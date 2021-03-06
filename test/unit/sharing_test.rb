require 'test_helper'

class SharingTest < ActiveSupport::TestCase
  setup do
    @user = Factory(:user)
    @notified_user = Factory(:user, :email => "hlxwell@gmail.com")
    @friend = @user.friends.create :name => "michael", :email => "hlxwell@gmail.com"
  end

  test "create sharing with sharing users" do
    sharing = @user.sharings.new  :invitation_text => "xxx",
                                    :sharing_users_attributes => [
                                      { :friend_id => @friend.id }
                                    ],
                                    :sharing_files_attributes => [
                                      { :folder => "xxx", :file => File.open(File.join(Rails.root, "test", "fixtures", "test_file.txt")) }
                                    ]
  
    assert sharing.save
    assert_equal 1, sharing.sharing_users.count
    assert_equal 1, sharing.sharing_files.count
    assert_equal 1, @notified_user.notifications.count
    assert !ActionMailer::Base.deliveries.empty?
  end

  test "after create sharing file should invoke notify_users" do
    sharing = @user.sharings.new  :invitation_text => "xxx",
                                  :total_file_count => 1,
                                  :sharing_users_attributes => [
                                    { :friend_id => @friend.id }
                                  ]
    assert sharing.save
    sharing.sharing_files.create! :folder => "xxx", :file => File.open(File.join(Rails.root, "test", "fixtures", "test_file.txt"))
    assert_equal 1, sharing.sharing_users.count
    assert_equal 1, sharing.sharing_files.count
    assert_equal 1, @notified_user.notifications.count
    assert !ActionMailer::Base.deliveries.empty?
  end

  test "json" do
    @sharing = Factory(:sharing, :user => @user)
    assert @sharing.to_json.size > 0
  end
end