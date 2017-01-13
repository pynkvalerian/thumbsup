class SlackJob < ApplicationJob
  queue_as :default

  def perform(message_id)
    tu = ThumbsUp.find(message_id)
    SlackService.new.send_message(tu.receiver.slack_id, tu.message)
  end
end
