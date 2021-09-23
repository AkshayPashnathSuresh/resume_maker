# frozen_string_literal: true

module Error
  module ErrorHandler
    def self.included(clazz)
      clazz.class_eval do
        rescue_from ActiveRecord::RecordNotFound do |_e|
          render status: 500
        end
        rescue_from StandardError do |_e|
          render status: 500
        end
      end
    end
  end
end
