module NestedModel
  extend ActiveSupport::Concern

  included do
    include ActiveModel::Model
  end

  module ClassMethods
    def has_one(name, options = {})
      klass = options.fetch(:class) { const_get(name.to_s.classify) }
      class_eval <<-CODE, __FILE__, __LINE__ + 1
        attr_accessor :#{name}
        validate :validate_#{name}

        def #{name}_attributes=(attributes)
          build_#{name}(attributes)
        end

        def build_#{name}(*args, &block)
          @#{name} = #{klass}.new(*args, &block)
        end

        def validate_#{name}
          return if @#{name}.try(:valid?)
          @#{name}.try(:errors).try(:each) do |attribute, error|
            errors.add(:"#{name}.\#{attribute}", error)
          end
        end

        class << self
          def human_attribute_name_with_#{name}(attribute, options = {})
            parts = attribute.to_s.split(".")
            if parts.shift == "#{name}" && parts.present?
              #{klass}.human_attribute_name(parts.join(".").to_sym, options)
            else
              human_attribute_name_without_#{name}(attribute, options)
            end
          end
          alias_method_chain :human_attribute_name, :#{name}
        end
      CODE
    end
  end
end
