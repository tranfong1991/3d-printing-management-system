class PrintController < ApplicationController

  def new

  end

  def upload
    @print = Print.create!(print_params)
    # TODO: Logic for checking if student exists in database
    flash[:success] = "Uploaded #{@print.filename} for UIN: #{@print.uin}"
    # flash[:success] = "You are authorized to print" # If student is in database
    # flash[:danger] = "You are not authorized to print" # If student is NOT in database
    redirect_to prints_path
  end

  private

  def print_params
    params.require(:print).permit(:uin, :status, :filename)
  end

end
