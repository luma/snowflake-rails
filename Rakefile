require "bundler"
Bundler.setup

gemspec = eval(File.read("snowflake-rails.gemspec"))

task :build => "#{gemspec.full_name}.gem"

file "#{gemspec.full_name}.gem" => gemspec.files + ["snowflake-rails.gemspec"] do
  system "gem build snowflake-rails.gemspec"
  system "gem install snowflake-rails-#{SnowflakeRails::VERSION}.gem"
end

Dir['tasks/**/*.rake'].each { |t| load t }