class ThumbsUp < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"

  after_save :perform_slack_job

  def perform_slack_job
    SlackJob.perform_later(self.id)
  end
end
