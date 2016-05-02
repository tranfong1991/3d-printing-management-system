class StudentsController < ApplicationController
    before_action :require_admin, only: [:index, :new]
    
    def index
        @students = Student.all
    end
    
    def new
        @student = Student.new
    end
    
    def update_note
        id = params[:id]
        note = params[:note]
        
        student = Student.find(id)
        student.note = note
        respond_to do |format|
            if student.save
                format.js { render :nothing => true }
            else
                format.js { render :nothing => false }
            end
        end
    end
    
    def update
    end
    
    def create
        @student = Student.new(user_params)
        if @student.save
            flash[:success] = "#{@student.uin}, #{@student.first_name}, #{@student.last_name}, #{@student.email} was successfully created."
        else
            flash[:danger] = "Failed to add new student"
        end
        redirect_to new_student_path
    end
    
private
    # Strong Parameters 
    def user_params
        params.require(:student).permit(:first_name, :last_name, :uin, :email, :note)
    end
end
