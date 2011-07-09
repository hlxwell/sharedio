# => 1. A rake task will check any (uploading completed, uploaded = total) (sharings) need to be sent.
# => 2. Send mail to all (sharing_users) which contains a list of sharing_files.
# => 3. If sharing_user's email is included in users table, add a (Notification) to that sharing_user.
# => 4. User will check the Notification periodically. if has, mark as viewed, and show popup to user.
# => 5. if the Notification is sent from the user in (white list => Friends marked as trust), just show the popup, but don't need confirmation, just download automatically.

require 'test_helper'

class ShareFileTest < ActionController::IntegrationTest
  context "A registered user" do
    setup do
      
    end

    should "be able to manage friend" do
      
    end

    context "when upload sharing" do
      setup do
        
      end

      should "be able to add sharing files" do
        
      end
      
      should "be able to add sharing files" do
        
      end
    end
  end
  
end
