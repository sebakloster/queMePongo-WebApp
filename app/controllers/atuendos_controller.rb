class AtuendosController < ApplicationController

    before_action :finder_guardarropa

    def index
        
        @atuendos = Atuendo.all
        @guardarropa = Guardarropa.find(params[:guardarropa_id])
    end

    def edit
        @prendas_cabeza = Prenda.where("prenda_tipo_id = ? AND guardarropa_id = ?", 1, params[:guardarropa_id])
        @prendas_torso = Prenda.where("prenda_tipo_id = ? AND guardarropa_id = ?", 2, params[:guardarropa_id])
        @prendas_piernas = Prenda.where("prenda_tipo_id = ? AND guardarropa_id = ?", 3, params[:guardarropa_id])
        @prendas_pies = Prenda.where("prenda_tipo_id = ? AND guardarropa_id = ?", 4, params[:guardarropa_id])
        @atuendo = Atuendo.find(params[:id])
    end

    def update
        @atuendo = Atuendo.find(params[:id])
  
        if @atuendo.update(atuendos_params)
            flash[:success]="El atuendo se actualizó correctamente!"
            render :show
        else
            flash[:error]="El atuendo no se actualizó :("
            render :edit
        end
    end

       def generate
        
        @prendas_cabeza = Prenda.where("prenda_tipo_id = ? AND guardarropa_id = ?", 1, params[:guardarropa_id])
        @prendas_torso = Prenda.where("prenda_tipo_id = ? AND guardarropa_id = ?", 2, params[:guardarropa_id])
        @prendas_piernas = Prenda.where("prenda_tipo_id = ? AND guardarropa_id = ?", 3, params[:guardarropa_id])
        @prendas_pies = Prenda.where("prenda_tipo_id = ? AND guardarropa_id = ?", 4, params[:guardarropa_id])

        @prendas_cabeza_selected = @prendas_cabeza.sample
        @prendas_torso_selected = @prendas_torso.sample
        @prendas_piernas_selected = @prendas_piernas.sample
        @prendas_pies_selected = @prendas_pies.sample

        if(@prendas_cabeza_selected.nil? || @prendas_torso_selected.nil? || @prendas_piernas_selected.nil? ||  @prendas_pies_selected.nil?)
            flash[:error]="No hay prendas suficientes :("
            @guardarropa = Guardarropa.find(params[:guardarropa_id])
            redirect_to @guardarropa
       
        end
        @atuendo= Atuendo.new
    end

    def show
        @atuendo= Atuendo.find(params[:id].to_i)
    end

    def new
        @prendas_cabeza = Prenda.where("prenda_tipo_id = ? AND guardarropa_id = ?", 1, params[:guardarropa_id])
        @prendas_torso = Prenda.where("prenda_tipo_id = ? AND guardarropa_id = ?", 2, params[:guardarropa_id])
        @prendas_piernas = Prenda.where("prenda_tipo_id = ? AND guardarropa_id = ?", 3, params[:guardarropa_id])
        @prendas_pies = Prenda.where("prenda_tipo_id = ? AND guardarropa_id = ?", 4, params[:guardarropa_id])
      @atuendo= Atuendo.new
    end

    def create
        
        @atuendo = Atuendo.new(atuendos_params);
        @atuendo.guardarropa_id = @guardarropa.id
        @atuendo.user_id = current_user.id
        if @atuendo.save
            flash[:success]="El atuendo se guardó correctamente!"
            redirect_to action: :index
        else
            flash[:error]="El atuendo no se guardó :("
            @prendas_cabeza = Prenda.where("prenda_tipo_id = ? AND guardarropa_id = ?", 1, params[:guardarropa_id])
            @prendas_torso = Prenda.where("prenda_tipo_id = ? AND guardarropa_id = ?", 2, params[:guardarropa_id])
            @prendas_piernas = Prenda.where("prenda_tipo_id = ? AND guardarropa_id = ?", 3, params[:guardarropa_id])
            @prendas_pies = Prenda.where("prenda_tipo_id = ? AND guardarropa_id = ?", 4, params[:guardarropa_id])
            render :new
        end
    end

    def destroy
        Atuendo.destroy(params[:id])
        redirect_to action: :index
    end

    private
    def atuendos_params
        params.require(:atuendo).permit( :cabeza_id, :torso_id, :pies_id, :piernas_id, :etiqueta_estacion, :etiqueta_tiempo, :etiqueta_formalidad, :puntaje, :descripcion, :user_id)
    end

    def finder_guardarropa
    @guardarropa= Guardarropa.find(params[:guardarropa_id])
    end
end
