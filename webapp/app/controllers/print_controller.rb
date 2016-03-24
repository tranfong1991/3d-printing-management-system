class PrintController < ApplicationController

  def new

  end

  def upload
    # TODO: Logic for checking if student exists in database
    flash[:success] = "You are authorized to print" # If student is in database
    # flash[:danger] = "You are not authorized to print" # If student is NOT in database
    redirect_to prints_path
  end

end
