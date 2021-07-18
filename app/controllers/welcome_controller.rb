# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    @resumes = Resume.where(user_id: current_user.id)
  end
end
