
$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'rails'
require 'active_support'

require 'yaml'
require 'snowflake'
require 'snowflake-migration'

module SnowflakeRails
  def self.init( config_path = File.join(Rails.root, 'config/database.snowflake.yml') )
    @settings = File.open( config_path, 'r' ) do |f|
                  YAML.load(f)[Rails.env]
                end

    Snowflake.logger = ::Rails.logger
    Snowflake.connect( @settings )
  end

  class Railtie < ::Rails::Railtie
    rake_tasks do
      load "snowflake-rails/railties/databases.rake"
    end
  end
end

require File.expand_path( '../snowflake-rails/version', __FILE__ )
require File.expand_path( '../snowflake-rails/railtie', __FILE__ )

# ActiveSupport.on_load(:action_controller) do
#   ActionController::Base.rescue_from Snowflake::NotFoundError,       :with => :not_found
#   ActionController::Base.rescue_from Snowflake::NotPersisted,        :with => :unprocessable_entity
# end

ActiveSupport.on_load(:before_initialize) do
  # Make sure any exceptions we raise will be properly interpreted by Rails
  ActionDispatch::ShowExceptions.rescue_responses.update({
    "Snowflake::NotFoundError"    => :not_found,
    "Snowflake::NotPersisted"     => :unprocessable_entity,
  })
end
