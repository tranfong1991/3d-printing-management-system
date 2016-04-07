require 'rails_helper'
require 'spec_helper'

RSpec.describe SessionsController, type: :controller do

end

describe SessionsController, :type => :controller do
	describe "login" do 
		it "should go to login page" do
	      {:get => login_path}.should route_to(
	        :controller => "sessions",
	        :action => "new"
	      )
	    end
	end

 #    describe "logout" do 
	#     it 'should post logout' do
	#       post :logout
	#       { :get => nil }.
	#         should route_to(:controller => "sessions", :action => "destroy")
	#     end
	# end
end