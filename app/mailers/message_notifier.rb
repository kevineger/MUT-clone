class MessageNotifier < ActionMailer::Base
  default from: "noreply@myunitrade.com"
  def send_first_message_notification(to, conversation)
    @conversation = conversation
    @to = to
    mail(:to => to.email, :subject => 'Your received a message about '+@conversation.subject)
  end
  def send_reply_notification(to, message)
    @message = message
    @to = to
    mail(:to => to.email, :subject => 'You have received a reply about '+@message.conversation.subject)
  end
end
