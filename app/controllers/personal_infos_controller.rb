# frozen_string_literal: true

class PersonalInfosController < ApplicationController
  def new
    @personal = Personal.new
  end

  def create
    @personal = Personal.where(user_id: current_user.id).first_or_initialize
    if @personal.update(user_params)
      redirect_to new_address_info_path
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:personal).permit(:first_name, :last_name, :technical_skills, :known_languages,
                                 :area_of_interests, :personal_profile, :carreer_objective)
  end
end
