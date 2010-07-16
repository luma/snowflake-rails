require File.expand_path("../lib/snowflake-rails/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "snowflake-rails"
  s.version     = SnowflakeRails::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Rolly Fordham"]
  s.email       = ["rolly@luma.co.nz"]
  s.homepage    = "http://github.com/luma/snowflake-rails"
  s.summary     = "A Rails plugin to allow the Snowflake ORM to be used from within a Rails app."
  s.description = "A Rails plugin to allow the Snowflake ORM to be used from within a Rails app."

  s.required_rubygems_version = ">= 1.3.6"

  # lol - required for validation
  s.rubyforge_project         = "snowflake-rails"

  # If you have other dependencies, add them here
  s.add_dependency "snowflake", ">= 0.0.1"
  s.add_dependency 'rails', '3.0.0.beta4'

  # If you need to check in files that aren't .rb files, add them here
  s.files        = Dir["{lib}/snowflake-rails.rb", "{lib}/snowflake-rails/version.rb", "{lib}/snowflake-rails/railtie.rb", "{lib}/snowflake-rails/**/*.rb", "{lib}/generators/snowflake/**/*.rb", "bin/*", "LICENSE", "*.md", "README.rdoc", "init.rb", "{lib}/generators/snowflake/install/templates/database.yml", "{lib}/snowflake-rails/railties/databases.rake"]
  s.require_path = 'lib'
end