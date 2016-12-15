class SessionsController < ApplicationController
    def destroy
        session[:user_id] = nil
        #reset_session <-- clears all keys from session
        redirect_to '/sessions/new'
    end

    def create
        user = User.find_by(email: login_params[:email])

        if user && user.authenticate(login_params[:password])
            session[:user_id] = user.id
            redirect_to '/shoes'
        else
            flash[:errors] = 'Invalid credentials'
            redirect_to '/sessions/new'
        end
    end

    private
        def login_params
            params.require(:login).permit(:email, :password)
        end
end
