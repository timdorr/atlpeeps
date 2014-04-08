require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ATLpeeps
  class Application < Rails::Application
    config.generators do |g|
      g.template_engine :slim

      g.test_framework :rspec, fixture: true
      g.fixture_replacement :factory_girl

      g.view_specs false
      g.helper_specs false
    end
  end
end
