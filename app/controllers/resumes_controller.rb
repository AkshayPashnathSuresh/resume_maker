class ResumesController < ApplicationController
  def show
    respond_to do |format|
      format.html
      format.pdf do
          render pdf: "Resume. #{current_user.id}",
          page_size: 'A4',
          template: "resumes/show.html.erb",
          layout: "resume_pdf.html.erb",
          orientation: "Portrait",
          lowquality: true,
          zoom: 1,
          dpi: 75
      end
  end
  end
end
