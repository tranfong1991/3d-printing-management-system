class StudentsController < ApplicationController
    before_action :require_admin, only: [:index, :new]
    
    def index
        @students = Student.all
    end
    
    def new
        @student = Student.new
    end
    
    def create
        @student = Student.new(user_params)
        if @student.save
            flash[:success] = "#{@student.uin}, #{@student.name}, #{@student.email} was successfully created."
        else
            flash[:danger] = "Failed to add new student"
        end
        redirect_to new_student_path
    end
    
private
    # Strong Parameters 
    def user_params
        params.require(:student).permit(:name, :uin, :email)
    end
end