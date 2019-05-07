require 'rails'
require 'administrate/field/text'
require 'administrate/engine'

module Administrate
  module Field
    class ActsAsTaggable < Administrate::Field::Text
      class Engine < ::Rails::Engine
        if defined?(Administrate::Engine)
          Administrate::Engine.add_javascript 'administrate-field-taggable/application'
          Administrate::Engine.add_stylesheet 'administrate-field-taggable/application'
        end
      end

      def context
        options.fetch(:context, @attribute)
      end

      def attribute
        context = super.to_s.singularize
        "#{context}_list"
      end

      def self.permitted_attribute(attr)
        context = super.to_s.singularize
        "#{context}_list"
      end

      def tags
        data
      end

      def name
        context.to_s
      end

      def delimitted
        tags.join(', ').to_s
      end

      def truncate
        delimitted.to_s[0...truncation_length]
      end

      def tag_options
        return [] unless defined? ActsAsTaggableOn::Tag

        ActsAsTaggableOn::Tag.for_context(context).order(:name).map do |t|
          { text: t.name, value: t.name }
        end
      end
    end
  end
end
