require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Framgiabook
  class Application < Rails::Application
    Bundler.require(*Rails.groups)
  	config.action_view.embed_authenticity_token_in_remote_forms = true
    config.assets.enabled = true
    config.assets.paths << Rails.root.join('/app/assets/fonts/Roboto')
  end
end
