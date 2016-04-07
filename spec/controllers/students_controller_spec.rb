require 'spec_helper'

describe StudentsController, :type => :controller do
  before (:each) do
      session[:admin_id] = "1"
  end

  before(:each) do
    @student = Student.new :uin => "123456789", :name => "Rev", :email => "rev@tamu.edu"
  end

  describe 'views' do
    before(:each) do
      @student = Student.new :uin => "123456789", :name => "Rev", :email => "rev@tamu.edu"
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe 'student controllers' do
    it "should create new student" do
      Student.stub(:new).and_return(double(Student))
      post :new
      #flash[:notice].should =~ /successfully created/i
    end
  end
end
