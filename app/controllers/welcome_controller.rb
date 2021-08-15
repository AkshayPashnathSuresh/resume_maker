# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    @personal = Personal.where(user_id: current_user.id)
  end
end
