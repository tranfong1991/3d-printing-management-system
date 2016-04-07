require 'spec_helper'

describe AdminsController, :type => :controller do
  describe 'templates' do
    before (:each) do
      session[:username] = "troll"
      session[:password_digest] = "lol"
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "renders the new template" do
      { :get => new_student_path(1) }.
        should route_to(:controller => "students", :action => "new", :format => "1")
    end

    it "should create new admin" do
      Admin.stub(:new).and_return(double(Admin))
      post :new
      #flash[:notice].should =~ /successfully created/i
    end

    it "should go to signup page" do
      {:get => signup_path}.should route_to(
        :controller => "admins",
        :action => "new"
      )
    end
  end
end
