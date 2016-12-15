class UsersController < ApplicationController
    def new
        #show login and registration page
        if !session[:user_id]
            session[:user_id] = ''
        end
    end

    def create
        user = User.new(user_params)

        if user.save
            session[:user_id] = user.id
            redirect_to '/dashboard'
        else
            flash[:errors] = user.errors.full_messages
            redirect_to '/'
        end
    end

    def dashboard
        @user = User.find(session[:user_id])
        @products = Product.all
    end

    def show
        @user = User.find(session[:user_id])
        @products = Product.all
    end

    private
        def user_params
            params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
        end
end
