module SnowflakeRails
  module Generators
    class InstallGenerator < Rails::Generators::Base
     # namespace "snowflake:install"
      source_root File.expand_path("../templates", __FILE__) 

      desc "This generator creates a template database config and initializer file for snowflake." 

      def create_database_config
        copy_file "database.yml", "config/database.snowflake.yml"
      end

      def create_initializer
        copy_file "initializer.rb", "config/initializers/snowflake.rb" 
      end
    end
  end # module Generators
end # module SnowflakeRails