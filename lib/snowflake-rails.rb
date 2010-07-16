
$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'snowflake'
require 'yaml'
'lib/snowflake-rails/'
module SnowflakeRails
  def self.init( config_path = File.join(Rails.root, 'config/database.snowflake.yml') )
    @settings = File.open( config_path, 'r' ) do |f|
                  YAML.load(f)[Rails.environment]
                end

    @settings[:logger] = ::Rails.logger
    Snowflake.connect( @settings )
  end

  class Railtie < Rails::Railtie
    rake_tasks do
      load "snowflake-rails/railties/databases.rake"
    end
  end
end

require 'lib/snowflake-rails/version'
require 'lib/snowflake-rails/railtie'

# ActiveSupport.on_load(:active_record) { self.logger ||= ::Rails.logger }