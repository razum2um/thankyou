module PostgreSQLUUIDAdapter
  extend ActiveSupport::Concern
  included do
    class_eval do
      alias_method_chain :quote, :uuid
    end
  end

  # Quotes PostgreSQL-specific data types for SQL input.
  def quote_with_uuid(value, column = nil) #:nodoc:
    return quote_without_uuid(value, column) if column.nil? || column.type.to_s.match(/^uuid/).nil?
    return value.strip == 'uuid_generate_v4()' ? "#{value}" : "'#{value}'"
  end
end

ActiveRecord::ConnectionAdapters::PostgreSQLAdapter.send :include, PostgreSQLUUIDAdapter
ActiveRecord::ConnectionAdapters::PostgreSQLAdapter::NATIVE_DATABASE_TYPES[:uuid] = { :name => "uuid" }
ActiveRecord::ConnectionAdapters::PostgreSQLAdapter::NATIVE_DATABASE_TYPES[:uuid_primary_key] = { :name => "uuid PRIMARY KEY" }


module PostgreSQLUUIDTableDefinition
  extend ActiveSupport::Concern
  included do
    class_eval do
      alias_method_chain :primary_key, :uuid
    end
  end

  def uuid(name, options = {})
    column(name, 'uuid', options)
  end

  def primary_key_with_uuid(name, type = :primary_key, options = {})
    return primary_key_without_uuid(name) unless type == :uuid
    options[:default] = options.fetch(:default, 'uuid_generate_v4()')
    column name, :uuid_primary_key, options
  end
end

ActiveRecord::ConnectionAdapters::TableDefinition.send :include, PostgreSQLUUIDTableDefinition

