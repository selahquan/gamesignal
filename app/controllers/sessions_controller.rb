class SessionsController < ApplicationController
    before_action :redirect_if_logged_in, only: [:new]

    def new 
        if logged_in?
            redirect_to_user_path(current_user)
        end
    end

    def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to root_path, notice: "Logged in successfully"
        else  
            flash[:alert] = "Invalid email or password"
            redirect_to login_path
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to '/login', notice: "Logged out"
    end
end

private

    def redirect_if_logged_in
        if current_user
            redirect_to "changeME"_path
        end
    end

    # def auth 
    #     request.env['omniauth.auth']
    # end