# frozen_string_literal: true

class EducationInfosController < ApplicationController
  before_action :initialize_error_messages, only: %i[new edit create update]
  before_action :initialize_education_infos, only: %i[new edit]

  def new; end

  def edit; end

  def create
    registration_succeeded? ? (redirect_to new_work_info_path) : (render 'new')
  end

  def update
    if registration_succeeded?
      flash[:notice] = t('education_infos.update_success_message')
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def add_new_education
    @index = params[:education_index]
    respond_to do |format|
      format.js { render partial: 'education_infos/add_education' }
    end
  end

  def delete_education
    @index = params[:education_index]
    respond_to do |format|
      format.js { render partial: 'education_infos/delete_education' }
    end
  end

  private

  def education_params(params)
    params.permit(:institution_name, :course_name, :studied_from,
                  :studied_to,       :grade_point, :achivements)
  end

  def initialize_error_messages
    @error_messages = []
  end

  def initialize_education_infos
    if current_user.educations.exists?
      @educations = current_user.educations
      @record_count = @educations.ids.length
    else
      @educations = []
      @record_count = 0
    end
  end

  def error_messages(error_record)
    error_record.errors.full_messages.each do |msg|
      @error_messages.push(msg)
    end
  end

  def set_education_records
    @educations = []
    params[:educations].each do |_id, attributes|
      @educations.push(current_user.educations.new(education_params(attributes)))
    end
    @educations
  end

  def registration_succeeded?
    submitting_records = set_education_records
    success = []
    Education.transaction do
      current_user.educations.delete_all if current_user.educations.exists?
      success = submitting_records.map(&:save)
      unless success.all?
        errored = submitting_records.reject { |record| record.errors.blank? }
        errored.each { |error_record| error_messages(error_record) }
        raise ActiveRecord::Rollback
      end
    end
    @error_messages.uniq!
    success.all?
  end
end
