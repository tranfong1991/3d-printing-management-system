require 'spec_helper'

describe StudentsController, :type => :controller do
  # before (:each) do
  #     session[:admin_id] = "1"
  # end

  # before(:each) do
  #   @student = Student.new :uin => "123456789", :name => "Rev", :email => "rev@tamu.edu"
  # end

  describe 'views' do

    before (:each) do
        session[:admin_id] = "1"
    end

    before(:each) do
      @student = Student.new :uin => "123456789", :email => "rev@tamu.edu"
    end

    it "renders the student index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "renders the student index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe 'students index' do 
    it "should go to students page" do
      {:get => students_path}.should route_to(
        :controller => "students",
        :action => "index"
      )
    end
  end

  describe 'student controllers' do
    before (:each) do
      session[:admin_id] = "1"
    end

    # it 'should update note' do
    #   post :update_note, :id => "1", format: :js
    # end

    # it "should go to update note page" do
    #   {:get => students_update_note_path}.should route_to(
    #     :controller => "students",
    #     :action => "show",
    #     :id =>"update_note"
    #   )
    # end

    it "should create new student" do
      Student.stub(:new).and_return(double(Student))
      post :new
      #flash[:notice].should =~ /successfully created/i
    end
  end
end
