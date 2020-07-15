class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to guardarropas_path, notice: "Te logueaste!"
        else
            flash.now[:alert] = "Tu contraseña o email no son correctos"
            render :new
        end 
    end
    
    def destroy
        session[:user_id] = nil
        flash[:success] = "Te deslogueaste!"
        redirect_to login_path
    end
end