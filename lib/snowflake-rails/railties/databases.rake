require 'fileutils'

namespace :snowflake do
  desc "Migrate the database to the latest version"
  task :migrate => 'snowflake:migrate:up'

  namespace :migrate do
    task :load => :environment do
      require 'snowflake-migration/runner'
      FileList["snowflake/schema/migrations/*.rb"].each do |migration|
        load migration
      end
    end

    desc "Migrate the database to the latest version"
    task :up => :load do
      migrate_up!
    end

    desc "Roll back all migrations"
    task :down => :load do
      migrate_down!
    end
  end
end