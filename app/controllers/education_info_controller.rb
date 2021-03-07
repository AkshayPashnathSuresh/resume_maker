class EducationInfoController < ApplicationController
    def new
        @education = Education.find_by(user_id: current_user)
    end

    def create 
        @education = Education.find_by(user_id: current_user)
        if @education
            if(@education.update(education_params))
                render 'new'
            else
                render 'new'
            end
        else
            @education = Education.new(education_params)
            @education.user = current_user
            if @education.save
                render 'new'
            else
                render 'new'
            end
        end
    end

    private

    def education_params
        params.require(:education).permit(:institution_name, :course_name, :studied_from,
                                          :studied_to, :grade_point, :achivements)
    end
end
