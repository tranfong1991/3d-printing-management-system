class AdminsController < ApplicationController
    before_action :require_admin, only: [:index, :show]
    
    def index
        
    end
    
    def new
        @admin = Admin.new
    end
    
    def create
        @admin = Admin.new(admin_params)
        if @admin.save
            session[:admin_id] = @admin.id
            redirect_to "/"
        else
            redirect_to "/signup"
        end
    end
    
private

    def admin_params
        params.require(:admin).permit(:first_name, :last_name, :username, :password)
    end
    
end
