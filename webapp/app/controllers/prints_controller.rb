class PrintsController < ApplicationController

  def new

  end

  def upload

    @student = Student.find_by(uin: params[:print][:uin]) # Get student from databse
    if !@student.nil? # If student exists
      @print = Print.create!(print_params)
      flash[:success] = "Uploaded #{@print.filename} for #{@student.name}: #{@print.uin}"
    else # If student does NOT exist
      flash[:danger] = "You are not authorized to print"
    end

    redirect_to new_print_path
  end

  private

  def print_params
    params.require(:print).permit(:uin, :status, :filename)
  end

end
