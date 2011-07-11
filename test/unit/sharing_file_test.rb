require 'test_helper'

class SharingFileTest < ActiveSupport::TestCase
  setup do
    @user = Factory(:user)
    @sharing = Factory(:sharing, :user => @user)
  end

  test "update the uploaded_file_count after created" do
    assert_equal 0, @sharing.uploaded_file_count
    @sharing.sharing_files << Factory.build(:sharing_file)
    @sharing.reload
    assert_equal 1, @sharing.uploaded_file_count
  end
end