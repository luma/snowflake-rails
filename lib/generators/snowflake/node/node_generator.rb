module Snowflake
 module Generators
    class NodeGenerator < Rails::Generators::NamedBase
      # namespace "snowflake:node"
      source_root File.expand_path("../templates", __FILE__)

      desc "This generator creates a Snowflake Node model" 

      # all public methods in here will be run in order
      def create_node_template
        template "node.rb", "app/models/#{class_path}.rb"
      end
    end
 end # module Generators
end # module Snowflake