class PrintsController < ApplicationController
  before_action :require_admin, only: [:queue, :show]

  # GET /prints
  def new
    @print = Print.new
    # Direct to index
  end

  # POST /prints
  def upload
    @student = Student.find_by(uin: params[:print][:uin]) # Get student from database
    if !@student.nil? # If student exists
      uploaded_file = params[:print][:file]
      datetime = Time.now.strftime("%m-%d-%y_%H:%M:%S")

      @print = Print.new do |p|
        p.uin = params[:print][:uin]
        p.filename = File.basename(uploaded_file.original_filename, ".*")
      end

      # Get instance
      s3 = Aws::S3::Resource.new(region: 'us-west-2')
      # Get bucket
      bucket = s3.bucket('3d-prints')
      obj = bucket.object("#{@print.uin}_#{datetime}_#{@print.filename}")
      # Upload file
      obj.put(body: uploaded_file)

      @print.url = obj.public_url
      @print.extension = File.extname(uploaded_file.original_filename)

      @print.save

      flash[:success] = "Uploaded #{@print.filename} for #{@student.name}: #{@print.uin}"
    else # If student does NOT exist
      flash[:danger] = 'You are not authorized to print'
    end

    redirect_to new_print_path
  end

  # GET /prints/queue
  def queue
    @prints = Print.where('status < 3') # Don't get aborted/canceled or rejected prints
  end
  
  def show
    @prints = Print.where(:uin => params[:uin]).order('status DESC, created_at DESC')
  end
  
  def detail
    @print = Print.find_by(:filename => params[:filename])
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
    params.require(:print).permit(:uin, :status, :filename, :note)
  end

end
