require 'test_helper'

class SharingsControllerTest < ActionController::TestCase
  context "sharings controller" do
    setup do
      @user = Factory(:user)
      @friend = @user.friends.create :name => "michael", :email => "hlxwell@gmail.com"
      sign_in :user, @user
    end

    should "create sharing" do
      post :create, :sharing => {
        :invitation_text => "xxx",
        :total_file_count => 1,
        :sharing_users_attributes => [
          { :friend_id => @friend.id }
        ],
        :sharing_files_attributes => [
          { :folder => "xxx", :file => File.open(File.join(Rails.root, "test", "fixtures", "test_file.txt")) }
        ]
      }

      @user.reload
      assert_equal 1, @user.sharings.count
      assert_equal 1, @user.sharings.first.sharing_users.count
      assert_equal 1, @user.sharings.first.sharing_files.count
      assert_redirected_to sharing_path( @user.sharings.first)
    end
  end
end
