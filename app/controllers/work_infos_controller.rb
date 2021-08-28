# frozen_string_literal: true

class WorkInfosController < ApplicationController
  before_action :initializeErrorMessages, only: [:new, :edit, :create, :update]
  before_action :initializeWorkInfos, only: [:new, :edit]
  before_action :executeWorkData, only: [:create, :update]

  def new
  end

  def edit
  end

  # If there is no error in the user-entered inputs,
  #   then display welcome Page else render existing page
  def create
    (@update_succes_status)? (redirect_to root_path) : (render 'new')
  end

  # If there is no error in the user-entered inputs,
  #   then display welcome Page else render existing page
  def update
    (@update_succes_status)? (redirect_to root_path) : (render 'edit')
  end

  # Creates new work input area
  def add_new_work
    @@submitting_records += 1
    @work_id = get_new_work_id
    @work = Work.where(id: @work_id, user_id: current_user.id).first_or_initialize
    respond_to do |format|
      format.js{ render partial: 'work_infos/addwork'}
    end
    @@work_ids.push(@work_id)
  end

  # Delete work records from DB
  def delete_work
    @@delete_work_ids.each do |work_id|
      Work.find_by(id: work_id)&.destroy
    end
  end

  # Delete work input area from the interface and add work Id 
  # to the list containing the work_Ids to be deleted 
  def set_delete_work_ids
    @@submitting_records -= 1
    @delete_work_id = params[:delete_work_id]
    @@delete_work_ids.push(@delete_work_id) 
    respond_to do |format|
      format.js{ render partial: 'work_infos/deletework'}
    end
  end

  private

  def work_params(params)
    params.permit(:company_name, :designation, :work_from,
                                 :work_to,      :job_description)
  end

  # Initialize the array that holds error messages
  def initializeErrorMessages
    @error_messages = []
  end

  # Initialize the arrays and variables that holds the work details.
  def initializeWorkInfos
    @@work_ids = []
    @@delete_work_ids = []
    setWorkRecords
  end

  # Get Work record for the current user if exists
  # Else initialize arrays and variables
  def setWorkRecords
    if Work.exists?(user_id: current_user.id)
      @works = Work.where(user_id: current_user.id)
      @@work_ids = @works.ids
      @@submitting_records  = @@work_ids.length
    else
      @works = []
      @@work_ids = []
      @@submitting_records  = 0
    end
  end

  # Delete, create or update the work records 
  def executeWorkData
    delete_work
    @works = []
    @update_succes_status = true
    params[:works].each do |id, attributes|
      @work = Work.where(id: id, user_id: current_user.id).first_or_initialize
      unless @work.update(work_params(attributes))
        @update_succes_status = false
        set_error_messages(@work)
      end
      retainUserInput(@work)
    end
    @error_messages.uniq!
  end

  # Retain the user entered input for rendering the same page in case of errors.
  def retainUserInput(inputRecord)
    @works.push(@work)
  end

  # Sets the record validation errors
  def set_error_messages(error_record)
    error_record.errors.full_messages.each do |msg|
      @error_messages.push(msg)
    end
  end

  # Get work Id for the new record
  def get_new_work_id
    new_id_client = get_new_id_from_client
    new_id_server = get_new_id_from_DB
    Work.exists?(id: new_id_client) ? new_id_server : new_id_client
  end

  # Get new Id by considering the records in the DB
  # If there is records in DB, then new ID will be latest ID + 1
  # If there is no records in DB, then new ID will be  1
  def get_new_id_from_DB
    latest_id = Work.ids.max
    new_id = latest_id.nil? ? '1' : (latest_id + 1) 
  end

  # Get new Id by considering the Ids in the Client Side(Interface)
  # New Id will be the latest Id + 1
  def get_new_id_from_client
    (@@work_ids.max.nil?) ? 1 : (@@work_ids.max + 1)
  end
end
