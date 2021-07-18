# frozen_string_literal: true

class ResumeInfosController < ApplicationController
  def new
    @resume = Resume.new
  end

  def create
    @resume = Resume.new(user_id: current_user.id)
    if @resume.update resume_params
      @resume.save
      redirect_to new_personal_info_path
    else
      render 'new'
    end
  end

  def resume_params
    params.require(:resume).permit(:resume_name, :layout_id)
  end
end
