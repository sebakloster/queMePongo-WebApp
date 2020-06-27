class AtuendosController < ApplicationController

    before_action :finder_guardarropa

    def index
        
        @atuendos=Atuendo.where(guardarropa: @guardarropa)

        if(!params[:etiqueta_estacion].blank?)
            @atuendos = @atuendos.where("etiqueta_estacion = :etiqueta", { etiqueta: Atuendo.etiqueta_estacions[params[:etiqueta_estacion]]})
        end

        if(!params[:etiqueta_formalidad].blank?)
            @atuendos= @atuendos.where("etiqueta_formalidad = :etiqueta", { etiqueta: Atuendo.etiqueta_formalidads[params[:etiqueta_formalidad]]})
        end

        if(!params[:etiqueta_tiempo].blank?)
            @atuendos = @atuendos.where("etiqueta_tiempo = :etiqueta", {etiqueta: Atuendo.etiqueta_tiempos[params[:etiqueta_tiempo]]})
        end
        
        @estacion_selected = !params[:etiqueta_estacion].blank? ? params[:etiqueta_estacion] : nil;
        @tiempo_selected = !params[:etiqueta_tiempo].blank? ? params[:etiqueta_tiempo] : nil;
        @formalidad_selected = !params[:etiqueta_formalidad].blank? ? params[:etiqueta_formalidad] : nil;
    end

  


    def edit 
        
        @prendas_cabeza = Guardarropa.find(params[:guardarropa_id]).prendas_cabeza 
        @prendas_torso = Guardarropa.find(params[:guardarropa_id]).prendas_torso
        @prendas_piernas = Guardarropa.find(params[:guardarropa_id]).prendas_piernas
        @prendas_pies = Guardarropa.find(params[:guardarropa_id]).prendas_pies
        @atuendo = Atuendo.find(params[:id])
        if(UserValidado?)
            @atuendo
        else
            render :index, status: 403
            flash[:error]="Ha ocurrido un error! :("
        end

    end

    def update
        @atuendo = Atuendo.find(params[:id])

        if(UserValidado?)
            if @atuendo.update(atuendos_params)
                flash[:success]="El atuendo se actualizó correctamente!"
                render :show
            else
                flash[:error]="El atuendo no se actualizó :("
                render :edit
            end
        else
            render :index, status: 403
        end
    end

    def generate
        
        @prendas_cabeza = Guardarropa.find(params[:guardarropa_id]).prendas_cabeza 
        @prendas_torso = Guardarropa.find(params[:guardarropa_id]).prendas_torso
        @prendas_piernas = Guardarropa.find(params[:guardarropa_id]).prendas_piernas
        @prendas_pies = Guardarropa.find(params[:guardarropa_id]).prendas_pies

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

        if(UserValidado?)
            @atuendo
        else
            render :index, status: 403
        end
    end

    def new
        @prendas_cabeza = Guardarropa.find(params[:guardarropa_id]).prendas_cabeza 
        @prendas_torso = Guardarropa.find(params[:guardarropa_id]).prendas_torso 
        @prendas_piernas = Guardarropa.find(params[:guardarropa_id]).prendas_piernas 
        @prendas_pies = Guardarropa.find(params[:guardarropa_id]).prendas_pies 
        @atuendo= Atuendo.new
    end

    def create
        
        @atuendo = Atuendo.new(atuendos_params);
        @atuendo.guardarropa = @guardarropa
        if @atuendo.save
            flash[:success]="El atuendo se guardó correctamente!"
            redirect_to action: :index
        else
            flash[:error]="El atuendo no se guardó :("
            @prendas_cabeza = Guardarropa.find(params[:guardarropa_id]).prendas_cabeza 
            @prendas_torso = Guardarropa.find(params[:guardarropa_id]).prendas_torso 
            @prendas_piernas = Guardarropa.find(params[:guardarropa_id]).prendas_piernas 
            @prendas_pies = Guardarropa.find(params[:guardarropa_id]).prendas_pies 
            render :new
        end
    end

    def destroy
        @atuendo= Atuendo.find(params[:id])

        if(UserValidado?)
            Atuendo.destroy(params[:id])
            redirect_to action: :index
        else
            render :index, status: 403
        end
        
    end

    private
    def atuendos_params
        params.require(:atuendo).permit( :cabeza_id, :torso_id, :pies_id, :piernas_id, :etiqueta_estacion, :etiqueta_tiempo, :etiqueta_formalidad, :puntaje, :descripcion, :nombre)
    end

    def finder_guardarropa
        @guardarropa= Guardarropa.find(params[:guardarropa_id])
    end

    def UserValidado?
        @atuendo.user == current_user
      end
end
