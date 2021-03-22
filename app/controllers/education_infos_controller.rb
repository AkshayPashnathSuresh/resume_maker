# frozen_string_literal: true

class EducationInfosController < ApplicationController
  def new; end

  def create
    @education = Education.where(user_id: current_user).first_or_initialize
    if @education.update(education_params)
    # Move to Work History Page
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
