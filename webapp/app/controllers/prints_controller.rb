class PrintController < ApplicationController

  def new

  end

  def upload

    @student = Student.find_by(uin: params[:print][:uin])
    if !@student.nil? # If student is in database
      @print = Print.create!(print_params)
      flash[:success] = "Uploaded #{@print.filename} for #{@student.name}: #{@print.uin}"
    else # If student is NOT in database
      flash[:danger] = "You are not authorized to print"
    end

    redirect_to prints_path
  end

  private

  def print_params
    params.require(:print).permit(:uin, :status, :filename)
  end

end
