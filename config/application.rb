require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ChatSpace
  class Application < Rails::Application
    config.i18n.default_locale = :ja

    config.generators do |g|
        g.test_framework false
        g.helper false
        g.assets false
        g.test_framework :rspec,
          fixtures: true,
          view_specs: false,
          helper_specs: false,
          routing_specs: false,
          controller_specs: true,
          request_specs: false
        g.fixture_replacement :factory_girl, dir: "spec/factories"
    end

    config.action_view.field_error_proc = Proc.new do |html_tag, instance|
      %Q(#{html_tag}).html_safe
    end

    config.active_record.raise_in_transactional_callbacks = true
  end
end
