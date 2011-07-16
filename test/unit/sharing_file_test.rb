require 'test_helper'

class SharingFileTest < ActiveSupport::TestCase
  setup do
    @user = Factory(:user)
    @sharing = Factory(:sharing, :user => @user, :total_file_count => 1)
  end

  test "update the uploaded_file_count after created" do
    assert_equal 0, @sharing.uploaded_file_count
    @sharing.sharing_files << Factory.build(:sharing_file)
    @sharing.reload
    assert_equal 1, @sharing.uploaded_file_count
  end

  test "after last file uploaded should send notification" do
    friend = Factory.build(:friend)
    @user.friends << friend

    @sharing.sharing_users.create! :friend => friend
    @sharing.sharing_files << Factory.build(:sharing_file)
    @sharing.reload

    assert_equal 1, @sharing.notifications.count
  end
  
  test "should include download_store_path" do
    @sharing_file = Factory.build(:sharing_file, :sharing => @sharing)
    assert @sharing_file.download_store_path.size > 10
  end
end