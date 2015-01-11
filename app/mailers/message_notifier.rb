class MessageNotifier < ActionMailer::Base
  default from: "noreply@myunitrade.com"
  def send_first_message_notification(to, message)
    @message = message
    mail(:to => to.email, :subject => 'Your received a message about '+@message.conversation.title)
  end
  def send_reply_notification(to, message)
    @message = message
    mail(:to => to.email, :subject => 'You have received a reply about '+@message.conversation.title)
  end
end
