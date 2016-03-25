class StudentsController < ApplicationController
    def index
        @students = Student.all
    end
    
    def create
        @student = Student.create!(user_params)
        flash[:notice] = "#{@student.uin}, #{@student.name}, #{@student.email} was successfully created."
        redirect_to students_path
    end
    
private
    # Strong Parameters 
    def user_params
        params.require(:student).permit(:name, :uin, :email)
    end
end
