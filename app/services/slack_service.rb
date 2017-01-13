class SlackService
  def initialize
    @client = Slack::Web::Client.new
  end

  def update_users
    @client.users_list[:members].each do |user|
      next if ( user.is_bot || user.deleted )
      User.find_or_create_by(slack_id: user.id, username: user.name)
    end
  end

  def send_message(receiver_id, message)
    nice_message = formulate_message(message)
    @client.chat_postMessage(channel: receiver_id, text: nice_message, username: "ThumbsUpBot")
  end

  def formulate_message(message)
    ":+1: You've received a *THUMBS UP*! :+1: Message: \n> #{message}"
  end
end
