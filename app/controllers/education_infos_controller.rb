# frozen_string_literal: true

class EducationInfosController < ApplicationController
  before_action :initializeErrorMessages, only: [:new, :edit, :create, :update]
  before_action :initializeEducationInfos, only: [:new, :edit]
  before_action :executeEducationData, only: [:create, :update]

  def new
  end

  def edit
  end

  # If there is no error in the user-entered inputs,
  #   then display welcome Page else render existing page
  def create
    (@update_succes_status)? (redirect_to new_work_info_path) : (render 'new')
  end

  # If there is no error in the user-entered inputs,
  #   then display welcome Page else render existing page
  def update
    (@update_succes_status)? (redirect_to root_path) : (render 'edit')
  end

  # Creates new education input area
  def add_new_education
    @@submitting_records += 1
    @education_id = get_new_education_id
    @education = Education.where(id: @education_id, user_id: current_user.id).first_or_initialize
    respond_to do |format|
      format.js{ render partial: 'education_infos/addeducation'}
    end
    @@education_ids.push(@education_id)
  end

  # Delete education records from DB
  def delete_education
    @@delete_education_ids.each do |education_id|
      Education.find_by(id: education_id)&.destroy
    end
  end

  # Delete education input area from the interface and add education Id 
  # to the list containing the education_Ids to be deleted 
  def set_delete_education_ids
    @@submitting_records -= 1
    @delete_education_id = params[:delete_education_id]
    @@delete_education_ids.push(@delete_education_id) 
    respond_to do |format|
      format.js{ render partial: 'education_infos/deleteeducation'}
    end
  end

  private

  def education_params(params)
    params.permit(:institution_name, :course_name, :studied_from,
                  :studied_to,       :grade_point, :achivements)
  end

  # Initialize the array that holds error messages
  def initializeErrorMessages
    @error_messages = []
  end

  # Initialize the arrays and variables that holds the education details.
  def initializeEducationInfos
    @@education_ids = []
    @@delete_education_ids = []
    setEducationRecords
  end

  # Get Education record for the current user if exists
  # Else initialize arrays and variables
  def setEducationRecords
    if Education.exists?(user_id: current_user.id)
      @educations = Education.where(user_id: current_user.id)
      @@education_ids = @educations.ids
      @@submitting_records  = @@education_ids.length
    else
      @educations = []
      @@education_ids = []
      @@submitting_records  = 0
    end
  end

  # Delete, create or update the education records 
  def executeEducationData
    delete_education
    @educations = []
    @update_succes_status = true
    params[:educations].each do |id, attributes|
      @education = Education.where(id: id, user_id: current_user.id).first_or_initialize
      unless @education.update(education_params(attributes))
        @update_succes_status = false
        set_error_messages(@education)
      end
      retainUserInput(@education)
    end
    @error_messages.uniq!
  end

  # Retain the user entered input for rendering the same page in case of errors.
  def retainUserInput(inputRecord)
    @educations.push(@education)
  end

  # Sets the record validation errors
  def set_error_messages(error_record)
    error_record.errors.full_messages.each do |msg|
      @error_messages.push(msg)
    end
  end

  # Get education Id for the new record
  def get_new_education_id
    new_id_client = get_new_id_from_client
    new_id_server = get_new_id_from_DB
    Education.exists?(id: new_id_client) ? new_id_server : new_id_client
  end

  # Get new Id by considering the records in the DB
  # If there is records in DB, then new ID will be latest ID + 1
  # If there is no records in DB, then new ID will be  1
  def get_new_id_from_DB
    latest_id = Education.ids.max
    new_id = latest_id.nil? ? '1' : (latest_id + 1) 
  end
  
  # Get new Id by considering the Ids in the Client Side(Interface)
  # New Id will be the latest Id + 1
  def get_new_id_from_client
    (@@education_ids.max.nil?) ? 1 : (@@education_ids.max + 1)
  end

end
