require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ProyectoFinal
  class Application < Rails::Application
    config.action_mailer.raise_delivery_errors = true
    config.action_mailer.perform_deliveries = true
    config.action_mailer.delivery_method = :smtp
    config.action_mailer_smtp_settings = {
      
      :address => "smtp.gmail.com",
      :port => '587',
      :domain  => "gmail.com",
      :authentication => :plain,
      :user_name => "arddmrt@gmail.com",
      :password => "csrnevghdvesfjdn",
      :authentication       => :plain,
      :enable_starttls_auto => true
    }
    config.active_record.raise_in_transactional_callbacks = true
  end
end
