class MessageNotifier < ActionMailer::Base
  default from: "noreply@myunitrade.com"
  def send_first_message_notification(to,from, conversation)
    @conversation = conversation
    @to = to
    @from = from
    mail(:to => to.email, :subject => 'Your received a message about '+@conversation.subject)
  end
  def send_reply_notification(to,from, message)
    @message = message
    @to = to
    @from = from
    mail(:to => to.email, :subject => 'You have received a reply about '+@message.conversation.subject)
  end
end
