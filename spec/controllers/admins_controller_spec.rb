require 'spec_helper'

describe AdminsController, :type => :controller do
  describe 'templates' do
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "renders the new template" do
      { :get => new_student_path(1) }.
        should route_to(:controller => "students", :action => "new", :format => "1")
    end
  end
end
