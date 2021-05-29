# frozen_string_literal: true

class WorkInfosController < ApplicationController
  def new
    @work = Work.new
  end

  def create
    @work = Work.where(user_id: current_user.id).first_or_initialize
    if @work.update work_params
      flash[:notice] = t('work_infos_controller.information_saved')
      redirect_to root_path
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
