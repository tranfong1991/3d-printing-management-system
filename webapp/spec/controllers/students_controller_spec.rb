require "spec_helper"

describe StudentsController do
  describe 'views' do   
    it "should go to index page" do
      {:get => student}.should route_to(
        :controller => "students",
        :action => "index"
      )
    end
  end
  describe 'student controllers' do
    it "should create new student" do
      StudentsController.stub(:create).and_return(double(Student))
      get :create, {:id => "1"}
   end
   it "renders the new print view" do
     { :get => new_student_path(1) }.
     should route_to(:controller => "students", :action => "new", :format => "1")
   end  
  end
  

 end
 
