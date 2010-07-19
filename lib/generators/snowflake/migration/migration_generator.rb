
module Snowflake
  module Generators
    # rails g snowflake:migration migrate_company_and_staff_names Company Staff
    class MigrationGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__) 

      argument :title, :type => :string, :banner => "migration_title"
      argument :elements, :type => :array, :banner => "Element1 Element2 Element3"

      desc "This generator creates a template migration file for snowflake." 

      def create_migration_dirs
        empty_directory "snowflake"
        empty_directory "snowflake/schema"
        empty_directory "snowflake/schema/migrations"
      end

      # all public methods in here will be run in order
      def create_migration_file
        # Grab all existing versions
        migrations_path = File.join(Rails.root, "snowflake/schema/migrations/*.rb")
        @versions = Dir[migrations_path].collect do |m|
          m.split('_').first.to_i
        end.sort

        @migration_version = @versions.empty?? 1 : @versions.last + 1

        template "migration.rb", "snowflake/schema/migrations/#{@migration_version}_#{title}.rb"
      end

      private

    end
  end # module Generators
end # module Snowflake
