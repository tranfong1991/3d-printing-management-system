require 'spec_helper'

describe AdminsController, :type => :controller do
  before (:each) do
    session[:admin_id] = "1"
  end
  
  describe 'templates' do
    it "returns http success" do
      if session[:username].present?
        get :create
        expect(response).to have_http_status(:success)
      else
        @a=Admin.create :username => "rafa", :first_name => "rafa", :last_name => "moreno", :password => "rafa"
        current_user = @a
        get :create
        expect(response).to have_http_status(:redirect)
      end
    end

    it "renders the admin template" do
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
