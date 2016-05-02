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
        p.extension = File.extname(uploaded_file.original_filename)

        digest = Digest::SHA1.hexdigest(p.filename)
        while !digestUnique?(digest)
          digest = Digest::SHA1.hexdigest(digest)
        end
        p.digest = digest
      end

      # Get instance
      s3 = Aws::S3::Resource.new(region: 'us-west-2')
      # Get bucket
      bucket = s3.bucket('3d-prints')
      obj = bucket.object("#{@print.uin}_#{datetime}_#{@print.filename}_#{@print.extension}")
      # Upload file
      obj.put(body: uploaded_file)

      @print.url = obj.public_url
      @print.save

      send_email(@student, @print)
      flash[:success] = "Uploaded #{@print.filename} for #{@student.first_name} #{@student.last_name}: #{@print.uin}"
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
    @print = Print.find_by(:digest => params[:digest])
  end

  # POST /prints/update_status
  # Should be strictly used by async javascript calls
  def update_status
    new_status = params[:status]
    id = params[:id]
    queued_print = Print.find(id)
    student = Student.find_by(:uin => queued_print.uin)
    queued_print.status = new_status
    send_email(student, queued_print)
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
  
  def digestUnique?(digest)
    print = Print.find_by(:digest => digest)
    if print.nil?
      return true
    end
    return false
  end

  def send_email(student, print)

    text = ""
    sub = ""

    if print.pending?
      sub = "[EIC] Print Queued."
      text = "<p>Your print has been successfully uploaded and is now in the queue. You can check the status of your print <em>here</em>: http://ruby-on-rails-tranfong1991.c9users.io:8081/prints/detail/#{print.digest}</p>"
    elsif print.started?
      sub = "[EIC] Print Started."
      text = "<p>Your print has been started! We will email you when it is complete.</p>"
    elsif print.completed?
      sub = "[EIC] Print Completed."
      text = "<p>Your print s complete and ready for pickup! Please come to the EIC to receive your print.</p>"
    elsif print.aborted?
      sub = "[EIC] Print Delayed."
      text = "<p>Your print has been stopped... This will add a delay to your print. Please stand by for more information.</p>"
    elsif print.canceled?
      sub = "[EIC] Print Canceled."
      text = "<p>Your print has been canceled... If you did not cancel it, please come to the EIC to understand why.</p>"
    else
      return nil
    end

    Gmail.connect!('nerfherders431@gmail.com', 'csce431nerf') do |gmail|
      gmail.deliver do
        to student.email
        subject sub
        html_part do
          content_type 'text/html; charset=UTF-8'
          body text
        end
      end
    end
  end

end
