class SessionsController < ApplicationController
    def new
    end
    
    def create
        @admin = Admin.find_by(:username => params[:session][:username])
        if @admin && @admin.authenticate(params[:session][:password])
            session[:admin_id] = @admin.id
<<<<<<< HEAD
<<<<<<< HEAD
=======

>>>>>>> 8251c2f7663bf62a5d40baea9c65cc69c7c6edc7
            flash[:success] = "Successfully signed in"
            redirect_to '/'
=======
            redirect_to '/prints/new'
>>>>>>> ca2fbb25dd7abe220f1a6405e36910bf4fe41870
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
