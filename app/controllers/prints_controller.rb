class PrintsController < ApplicationController
  before_action :require_admin, only: [:queue, :show]

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
    @prints = Print.where("status < 3") # Don't get aborted/canceled or rejected prints
  end
  
  def show
    @prints = Print.where(:uin => params[:id])
  end

  # POST /prints/update_status
  # Should be strictly used by async javascript calls
  def update_status
    new_status = params[:status]
    id = params[:id]
    queued_print = Print.find(id)
    queued_print.status = new_status
    respond_to do |format|
      if queued_print.save
        format.js { render :nothing => true }
      else
        format.js { render :nothing => false }
      end
    end
  end

  private

  def print_params
    params.require(:print).permit(:uin, :status, :filename)
  end

end
