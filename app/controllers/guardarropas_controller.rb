class GuardarropasController < ApplicationController
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
      @guardarropa.user_id = current_user.id
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
      Guardarropa.destroy(params[:id])
      redirect_to action: :index
    end

    def guardarropa_params
        params.require(:guardarropa).permit(:guardarropa_id, :name, :user_id)
    end
end