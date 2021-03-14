class WorkInfosController < ApplicationController
  def new
  end

  def create
    @work = Work.where(user_id: current_user).first_or_initialize
    if(@work.update(work_params))
      #Move to Next Interface
    else
      render 'new'
    end
  end

  private

  def work_params
    params.require(:work).permit(:company_name, :designation, :work_from,
                                 :work_to, :job_description)
  end
end
