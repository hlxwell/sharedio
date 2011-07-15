class UserMailer < ActionMailer::Base
  default :from => "notify@shared.io"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.new_sharing.subject
  #
  # UserMailer.new_sharing(sharing, friend).deliver
  #
  def new_sharing sharing, friend
    @files = sharing.sharing_files
    @user = sharing.user
    @friend = friend
    mail :to => friend.email
  end
end
