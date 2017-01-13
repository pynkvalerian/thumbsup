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
end
