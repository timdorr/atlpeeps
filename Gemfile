source 'https://rubygems.org'

ruby '2.1.1'

gem 'rails', '4.0.4'

# App Server
gem 'foreman', '~> 0.63'
gem 'dotenv-rails', :groups => [:development, :test]
gem 'puma'

# Database
gem 'pg'

# Assets
gem 'slim-rails', '~> 2.1'
gem 'sass-rails', '~> 4.0.3'
gem 'bootstrap-sass', '~> 3.1.1'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'

group :development, :test do
  gem 'rspec'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'faker'
end

group :test do
  gem 'vcr'
  gem 'webmock'
end

group :development do
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'quiet_assets'
  gem 'meta_request'
end

# Authentication
gem 'omniauth-facebook'
gem 'omniauth-twitter'
gem 'omniauth-github'

# Image Files
gem "paperclip", "~> 4.1"
gem "aws-sdk"