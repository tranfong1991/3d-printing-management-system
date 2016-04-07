require 'spec_helper'

describe PrintsController, :type => :controller do
  before (:each) do
    session[:admin_id] = "1"
  end
  # jeff 1
  # andy 19
  # bob 20
    
  describe 'views' do   
    it "renders the new view" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe 'views' do
    before(:each) do
      @print = Print.new :uin => "123456789", :filename => "text.txt", :created_at => "2016-04-07 16:30:49.754220", :updated_at => "2016-04-07 16:30:49.754220"
    end
  end

  describe "queue" do 
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