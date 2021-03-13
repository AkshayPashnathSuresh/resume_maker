# frozen_string_literal: true

class PersonalInfosController < ApplicationController
  def new; end

  def create
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to new_address_info_path
    else
      render 'new'
    end
  end

  def update; end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :technical_skills, :known_languages,
                                 :area_of_interests, :personal_profile, :carreer_objective)
  end
end
