# frozen_string_literal: true

class WorkInfosController < ApplicationController
  def new; end

  def create
    @work = Work.find_or_create_by(user_id: current_user.id)
    if @work.update work_params
      # Move to Next Interface
    else
      render 'new'
    end
  end

  private

  def work_params
    params.require(:work).permit(:company_name, :designation, :work_from,
                                 :work_to,      :job_description)
  end
end
