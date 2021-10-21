# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    @personal = Personal.where(user_id: current_user.id)
  end

  def settings
    @personal = Personal.where(user_id: current_user.id)
  end

  def about; end

  def privacy_policy; end

  def destroy
    current_user.destroy
    flash[:notice] = t('welcome_controller.user_delete_message')
    redirect_to new_user_session_path
  end
end
