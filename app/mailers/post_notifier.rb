class PostNotifier < ActionMailer::Base
  default from: "noreply@myunitrade.com"
  def send_expiring_email(post)
    @post = post
    mail(:to => @post.user.email, :subject => 'Your MyUniTrade post for '+@post.title+' is expiring soon!')
  end
end
