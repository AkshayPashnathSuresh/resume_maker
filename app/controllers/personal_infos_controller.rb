# frozen_string_literal: true

class PersonalInfosController < ApplicationController
  def new
    @personal = Personal.new
  end

  def edit
    @personal = Personal.where(user_id: current_user.id).first_or_initialize
  end

  def create
    @personal = Personal.new(user_params)
    @personal.user = current_user
    if @personal.save
      redirect_to new_address_info_path
    else
      render 'new'
    end
  end

  def update
    @personal = Personal.where(user_id: current_user.id).first_or_initialize
    if @personal.update(user_params)
      flash[:notice] = t('personal_infos.update_success_message')
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:personal).permit(:first_name, :last_name, :technical_skills, :known_languages,
                                     :area_of_interests, :personal_profile, :carreer_objective)
  end
end
