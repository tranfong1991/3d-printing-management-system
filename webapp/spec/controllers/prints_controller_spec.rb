require 'spec_helper'

describe PrintsController, :type => :controller do
  describe 'views' do   
    it "renders the new view" do
      get :new
      expect(response).to render_template("new")
    end

    it "renders the new student view" do
      { :get => new_print_path(1) }.
      should route_to(:controller => "prints", :action => "new", :format => "1")
    end
  end
end    
    
