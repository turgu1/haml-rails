require 'rails/generators/erb/scaffold/scaffold_generator'

module Haml
  module Generators
    class ScaffoldGenerator < Erb::Generators::ScaffoldGenerator
      source_root File.expand_path("../templates", __FILE__)

      def copy_view_files
        available_specific_views.each do |view|
          filename = filename_with_extensions(view)
          template "#{view}.html.haml", File.join("app/views", controller_file_path, filename)
        end
        available_generic_views.each do |view|
          template "#{view}.html.haml", File.join("app/views/application", "#{view}.html.haml")
          template "#{view}.js.erb", File.join("app/views/application", "#{view}.js.erb")
        end
      end

      hook_for :form_builder, :as => :scaffold

      def copy_form_file
        if options[:form_builder].nil?
          filename = filename_with_extensions("_form")
          template "_form.html.haml", File.join("app/views", controller_file_path, filename)
        end
      end

    protected

      def available_generic_views
        %w(index edit show new)
      end

      def available_specific_views
        %w(_index _edit _show _new _edit_link _new_link)
      end

      def handler
        :haml
      end

    end
  end
end
