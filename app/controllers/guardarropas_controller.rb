class GuardarropasController < ApplicationController
  before_action :require_user
    def new
      @guardarropa= Guardarropa.new
    end
  
    def edit
      @guardarropa = Guardarropa.find(params[:id])
      if(!UserValidado?)
        flash[:error]="Ha ocurrido un errorr! :("
        render :index, status: 403
      end
      @guardarropa
    end
  
    def index
      @guardarropas = Guardarropa.where(user: current_user)
    end
  
    def show
      @guardarropa = Guardarropa.find(params[:id])
      if(UserValidado?)
        @guardarropa
      else
        flash[:error]="Ha ocurrido un error! :("
        render :index, status: 403
      end
      
    end
  
    def create
      @guardarropa=Guardarropa.create(guardarropa_params);
      @guardarropa.user = current_user
      if @guardarropa.save
        flash[:success]="El guardarropa se guardó correctamente!"
        redirect_to @guardarropa
      else
        flash[:error]="EL guardarropa no se guardó :("
        render :new
      end
    end
  
    def update
      @guardarropa = Guardarropa.find(params[:id])
      
      if(UserValidado?)
        if @guardarropa.update(guardarropa_params)
          flash[:success]="El guardarropa se actualizó correctamente!"
          redirect_to @guardarropa
        else
          flash[:error]="El guardarropa no se actualizó :("
          render :edit
        end
      else
        flash[:error]="Ha ocurrido un error! :("
        render :index, status: 403
      end
      
    end
  
    def destroy
      @guardarropa = Guardarropa.find(params[:id])
      if(UserValidado?)
        Guardarropa.destroy(params[:id])
        redirect_to action: :index
      else
        flash[:error]="Ha ocurrido un error! :("
        render :index, status: 403
      end
     
    end

    private
    def guardarropa_params
        params.require(:guardarropa).permit(:guardarropa_id, :name, :user_id)
    end
    def UserValidado?
      @guardarropa.user == current_user
    end
end