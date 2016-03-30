require 'spec_helper'

describe StudentsController, :type => :controller do
  describe 'views' do
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe 'student controllers' do
    it "should create new student" do
      StudentsController.stub(:create).and_return(double(Student))
      get :create, {:id => "1"}
    end
  end
end
