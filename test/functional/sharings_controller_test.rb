require 'test_helper'

class SharingsControllerTest < ActionController::TestCase
  context "sharings controller" do
    setup do
      @user = Factory(:user)
      sign_in :user, @user
      @friend = @user.friends.create :name => "michael", :email => "hlxwell@gmail.com"
    end

    should "create sharing" do
      post :create, {:sharing => {
        :invitation_text => "xxx",
        :sharing_users_attributes => {
          rand(10000) => { :friend_id => @friend.id }
        },
        :sharing_files_attributes => {
          rand(10000) => {
            :folder => "xxx",
            :file => File.open(File.join(Rails.root, "test", "fixtures", "test_file.txt"))
          }
        }
      }}
      assert_equal 1, Sharing.count
      assert_equal 1, Sharing.first.sharing_users.count
      assert_equal 1, Sharing.first.sharing_files.count
      assert_response :success
    end
  end
end
