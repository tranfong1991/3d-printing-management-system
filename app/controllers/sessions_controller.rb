class SessionsController < ApplicationController
    def new
    end
    
    def create
        @admin = Admin.find_by(:username => params[:session][:username])
        if @admin && @admin.authenticate(params[:session][:password])
            session[:admin_id] = @admin.id

            flash[:success] = "Successfully signed in"
            redirect_to '/'
        else
            flash[:danger] = "Incorrect username or password! Please try again."
            redirect_to '/login'
        end 
    end
    
    def destroy
        session[:admin_id] = nil
        redirect_to '/'
    end
end
