class GuardarropasController < ApplicationController
  before_action :require_user
  before_action :validar_usuario, only: [:show, :edit, :update, :destroy]
    def new
      @guardarropa= Guardarropa.new
    end
  
    def edit
      @guardarropa = Guardarropa.find(params[:id])
    end
  
    def index
      @guardarropas = Guardarropa.where(user: current_user)
    end
  
    def show
      @guardarropa = Guardarropa.find(params[:id]) 
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
        if @guardarropa.update(guardarropa_params)
          flash[:success]="El guardarropa se actualizó correctamente!"
          redirect_to @guardarropa
        else
          flash[:error]="El guardarropa no se actualizó :("
          render :edit
        end      
    end
  
    def destroy
      @guardarropa = Guardarropa.find(params[:id])
        Guardarropa.destroy(params[:id])
        redirect_to action: :index
     
    end

    private
    def guardarropa_params
        params.require(:guardarropa).permit(:guardarropa_id, :name, :user_id)
    end

    def validar_usuario
      if !(Guardarropa.find(params[:id]).user == current_user)
          render :index, status: 403
      end
    end
end