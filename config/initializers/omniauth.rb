OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'], { image_size: 'large' }
  provider :twitter,  ENV['TWITTER_KEY'],  ENV['TWITTER_SECRET'],  { image_size: 'original' }
  provider :github,   ENV['GITHUB_KEY'],   ENV['GITHUB_SECRET']
end