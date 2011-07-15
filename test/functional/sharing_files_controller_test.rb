require 'test_helper'

class SharingFilesControllerTest < ActionController::TestCase
  setup do
    @user = Factory(:user)
    sign_in :user, @user
    @friend = @user.friends.create :name => "michael", :email => "hlxwell@gmail.com"
    @sharing = @user.sharings.create! :invitation_text => "books"
  end

  test "should create" do
    post :create, {
      :sharing_id => @sharing.id,
      :file => File.open(File.join(Rails.root, "test", "fixtures", "test_file.txt"))
    }
    assert_response :success
  end

end
