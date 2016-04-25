require 'spec_helper'

describe PrintsController, :type => :controller do
  before (:each) do
    session[:admin_id] = "1"
  end

  before (:each) do
      session[:print_id] = "1"
    end

  # jeff 1
  # andy 19
  # bob 20
    
  describe 'views' do
    it "renders the new view" do
      get :new
      expect(response).to render_template("new")
    end 

    it "should go to show page" do
      {:get => print_path}.should route_to(
        :controller => "prints",
        :id => 1,
        :action => "show" # missing required keys: [:id]
      )
    end   
  end

  describe 'status' do
    before(:each) do
      @print = Print.new :uin => "123456789", :filename => "test.txt", :created_at => "2016-04-11 23:00:25 UTC", :updated_at => nil
    end
    
    before (:each) do
      session[:admin_id] = "1"
    end

    it 'should update status' do
      post :update_status, :id => "1", format: :js
    end

    it "should go to update status page" do
      {:get => prints_update_status_path}.should route_to(
        :controller => "prints",
        :action => "show",
        :id =>"update_status"
      )
    end
  end

  describe "upload fail" do
    it "sends a warning to user" do
      post :upload, print: { uin: "1234567890" }
      expect(response).to redirect_to(new_print_path)
      expect(flash[:danger]).to be_present
    end
  end

  describe 'queue' do 
    it "should go to queue page" do
      {:get => prints_queue_path}.should route_to(
        :controller => "prints",
        :action => "queue"
      )
    end

    it "renders the queue view" do
      get :queue
      expect(response).to render_template("queue")
    end
  end
end