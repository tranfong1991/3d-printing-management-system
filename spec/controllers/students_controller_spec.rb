require 'spec_helper'

describe StudentsController, :type => :controller do
  describe 'views' do
    before(:each) do
      @student = Student.new :uin => "123456789", :name => "Rafa", :email => "rafa@rafa.com"
    end

    before (:each) do
      session[:user_id] = "1"
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    # it "should have the right title" do
    #   get :index
    #   response.should have_selector("title", :text => "3d Printing Management")
    # end
  end

  describe 'student controllers' do
    it "should create new student" do
      Student.stub(:new).and_return(double(Student))
      post :new
      #flash[:notice].should =~ /successfully created/i
    end
  end
end
