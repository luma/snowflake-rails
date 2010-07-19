require "bundler"
Bundler.setup

require "spec"
require "snowflake"
require "snowflake-rails"

Spec::Runner.configure do |config|
  config.mock_with :mocha
end