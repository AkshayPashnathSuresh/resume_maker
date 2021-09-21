# frozen_string_literal: true

module Error
  module ErrorHandler
    def self.included(clazz)
      clazz.class_eval do
        rescue_from ActiveRecord::RecordNotFound do |_e|
          redirect_to not_found_path
        end
        rescue_from StandardError do |_e|
          redirect_to internal_server_error_path
        end
      end
    end
  end
end
