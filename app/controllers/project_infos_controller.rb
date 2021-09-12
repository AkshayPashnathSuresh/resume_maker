# frozen_string_literal: true

class ProjectInfosController < ApplicationController
  before_action :initialize_error_messages, only: %i[new edit create update]
  before_action :initialize_project_infos, only: %i[new edit]

  def new; end

  def edit; end

  def create
    if registration_succeeded?
      flash[:notice] = t('project_infos.information_saved')
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    if registration_succeeded?
      flash[:notice] = t('project_infos.update_success_message')
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def add_new_project
    @index = params[:project_index]
    respond_to do |format|
      format.js { render partial: 'project_infos/add_project' }
    end
  end

  def delete_project
    @index = params[:project_index]
    respond_to do |format|
      format.js { render partial: 'project_infos/delete_project' }
    end
  end

  def skip_continue
    flash[:notice] = t('project_infos.information_saved')
    redirect_to root_path
  end

  private

  def project_params(params)
    params.permit(:title, :description)
  end

  def initialize_error_messages
    @error_messages = []
  end

  def initialize_project_infos
    if current_user.projects.exists?
      @projects = current_user.projects
      @record_count = @projects.ids.length
    else
      @projects = []
      @record_count = 0
    end
  end

  def error_messages(error_record)
    error_record.errors.full_messages.each do |msg|
      @error_messages.push(msg)
    end
  end

  def set_project_records
    @projects = []
    params[:projects].each do |_id, attributes|
      @projects.push(current_user.projects.new(project_params(attributes)))
    end
    @projects
  end

  def registration_succeeded?
    submitting_records = set_project_records
    success = []
    Project.transaction do
      current_user.projects.delete_all if current_user.projects.exists?
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
