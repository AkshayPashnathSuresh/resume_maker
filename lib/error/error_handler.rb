module Error
    module ErrorHandler
      def self.included(clazz)
        clazz.class_eval do
          rescue_from ActiveRecord::RecordNotFound do |e|
            redirect_to not_found_path
          end
          rescue_from StandardError do |e|
            redirect_to internal_server_error_path
          end
        end
      end
    end
end