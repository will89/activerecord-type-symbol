# frozen_string_literal: true

module ActiveRecord
  module Type
    class Symbol < ActiveModel::Type::Value
      VERSION = '0.1.0'

      def type
        :symbol
      end

      private

      def cast_value(value)
        value.to_sym
      end
    end
  end
end
