class AdminsController < ApplicationController
    def index
        @admin = Admin.find(1)
        if @admin.username == params[:Username] && @admin.password == params[:Password]
            redirect_to new_account_path
        end
    end
end
