class User < ApplicationRecord
  has_many :sent_thumbs_ups, foreign_key: "sender_id"
  has_many :received_thumbs_ups, foreign_key: "receiver_id"

  def self.from_omniauth(auth_hash)
    user = find_or_create_by(slack_id: auth_hash[:extra][:raw_info][:user_id])
    user.username = auth_hash[:extra][:raw_info][:user]
    user.save!
    user
  end
end
