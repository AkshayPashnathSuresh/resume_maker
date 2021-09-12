# frozen_string_literal: true

class ResumesController < ApplicationController
  def show
    @personal = current_user.personal
    @address = current_user.address
    @works = current_user.works
    @educations = current_user.educations
    @projects = current_user.projects
    @color_theme = params[:color_theme]
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Resume. #{current_user.id}",
               page_size: 'A4',
               template: 'resumes/resume_layout1.html.erb',
               layout: 'resume_pdf.html.erb',
               encoding: 'UTF-8',
               orientation: 'Portrait',
               lowquality: true,
               zoom: 1,
               dpi: 75
      end
    end
  end
end
