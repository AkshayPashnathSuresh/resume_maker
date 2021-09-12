# frozen_string_literal: true

class WorkInfosController < ApplicationController
  before_action :initialize_error_messages, only: %i[new edit create update]
  before_action :initialize_work_infos, only: %i[new edit]

  def new; end

  def edit; end

  def create
    registration_succeeded? ? (redirect_to new_project_info_path) : (render 'new')
  end

  def update
    if registration_succeeded?
      flash[:notice] = t('work_infos.update_success_message')
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def add_new_work
    @index = params[:work_index]
    respond_to do |format|
      format.js { render partial: 'work_infos/add_work' }
    end
  end

  def delete_work
    @index = params[:work_index]
    respond_to do |format|
      format.js { render partial: 'work_infos/delete_work' }
    end
  end

  private

  def work_params(params)
    params.permit(:company_name, :designation, :work_from,
                  :work_to, :job_description)
  end

  def initialize_error_messages
    @error_messages = []
  end

  def initialize_work_infos
    if current_user.works.exists?
      @works = current_user.works
      @record_count = @works.ids.length
    else
      @works = []
      @record_count = 0
    end
  end

  def error_messages(error_record)
    error_record.errors.full_messages.each do |msg|
      @error_messages.push(msg)
    end
  end

  def set_work_records
    @works = []
    params[:works].each do |_id, attributes|
      @works.push(current_user.works.new(work_params(attributes)))
    end
    @works
  end

  def registration_succeeded?
    submitting_records = set_work_records
    success = []
    Work.transaction do
      current_user.works.delete_all if current_user.works.exists?
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
