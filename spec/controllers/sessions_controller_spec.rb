require 'rails_helper'
require 'spec_helper'

# RSpec.describe SessionsController, type: :controller do

# end

describe SessionsController, :type => :controller do

	# before(:each) do
 #      @admin = Admin.new
 #      @admin.username = "jefff"
 #    end

	describe "login" do 
		it "should go to login page" do
	      {:get => login_path}.should route_to(
	        :controller => "sessions",
	        :action => "new"
	      )
	    end
	end

	describe "logout" do 
		it "should go to logout page" do
	      {:delete => logout_path}.should route_to(
	        :controller => "sessions",
	        :action => "destroy"
	      )
	    end
	end

	describe "login fail" do
	    it "sends a warning to user" do
	      post :create, session: { username: "lulz", password: "password" }
	      expect(response).to redirect_to(login_path)
	      expect(flash[:danger]).to be_present
	    end
	end
end