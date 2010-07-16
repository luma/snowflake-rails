
module SnowflakeRails
  class Railtie < Rails::Railtie
    rake_tasks do
      load "snowflake-rails/railties/databases.rake"
    end
  end
end