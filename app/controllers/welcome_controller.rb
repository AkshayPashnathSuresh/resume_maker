# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    @user = User.find(current_user.id)
  end
end
