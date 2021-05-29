# frozen_string_literal: true

class EducationInfosController < ApplicationController
  def new
    @education = Education.new
  end

  def create
    @education = Education.where(user_id: current_user.id).first_or_initialize
    if @education.update education_params
      redirect_to new_work_info_path
    else
      render 'new'
    end
  end

  private

  def education_params
    params.require(:education).permit(:institution_name, :course_name, :studied_from,
                                      :studied_to,       :grade_point, :achivements)
  end
end
