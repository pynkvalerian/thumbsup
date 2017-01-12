Rails.application.config.middleware.use OmniAuth::Builder do
  provider :slack, ENV['SLACK_KEY'], ENV['SLACK_SECRET'], scope: 'users:read,identify', team: "BlueBirds"
end
