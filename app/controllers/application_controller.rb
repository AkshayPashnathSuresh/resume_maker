# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Error::ErrorHandler
  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(*)
    new_user_session_path
  end
end
