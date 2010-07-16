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
  s.files        = Dir["{lib}/**/*.rb", "bin/*", "LICENSE", "*.md", "README.rdoc", "init.rb", "{lib}/generators/templates/database.yml", "{lib}/snowflake-rails/railties/databases.rake"]
  s.require_path = 'lib'

  # If you need an executable, add it here
  # s.executables = ["snowflake-rails"]

  # If you have C extensions, uncomment this line
  # s.extensions = "ext/extconf.rb"
end