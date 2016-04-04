class PrintsController < ApplicationController

  # GET /prints
  def new
    # Direct to index
  end

  # POST /prints
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

  # GET /prints/queue
  def queue
    @prints = Print.all
  end

  private

  def print_params
    params.require(:print).permit(:uin, :status, :filename)
  end

end
