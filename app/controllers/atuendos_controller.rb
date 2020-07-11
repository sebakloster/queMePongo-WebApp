class AtuendosController < ApplicationController

    before_action :finder_guardarropa

    def index
        
        @atuendos=Atuendo.where(guardarropa: @guardarropa).paginate(page: params[:page], per_page: 3)

        if(!params[:etiqueta_estacion].blank?)
            @atuendos = @atuendos.where("etiqueta_estacion = :etiqueta", { etiqueta: Atuendo.etiqueta_estacions[params[:etiqueta_estacion]]})
        end

        if(!params[:etiqueta_formalidad].blank?)
            @atuendos= @atuendos.where("etiqueta_formalidad = :etiqueta", { etiqueta: Atuendo.etiqueta_formalidads[params[:etiqueta_formalidad]]})
        end

        if(!params[:etiqueta_tiempo].blank?)
            @atuendos = @atuendos.where("etiqueta_tiempo = :etiqueta", {etiqueta: Atuendo.etiqueta_tiempos[params[:etiqueta_tiempo]]})
        end

        if(!params[:orden_puntaje].blank?)
            @atuendos = @atuendos.order(puntaje: params[:orden_puntaje])
        end
        
        @estacion_selected = !params[:etiqueta_estacion].blank? ? params[:etiqueta_estacion] : nil;
        @tiempo_selected = !params[:etiqueta_tiempo].blank? ? params[:etiqueta_tiempo] : nil;
        @formalidad_selected = !params[:etiqueta_formalidad].blank? ? params[:etiqueta_formalidad] : nil;
        @order_puntaje = !params[:orden_puntaje].blank? ? params[:orden_puntaje] : nil;
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
        
        @prenda_cabeza = Guardarropa.find(params[:guardarropa_id]).prendas_cabeza.sample
        @prenda_torso = Guardarropa.find(params[:guardarropa_id]).prendas_torso.sample
        @prenda_piernas = Guardarropa.find(params[:guardarropa_id]).prendas_piernas.sample
        @prenda_pies = Guardarropa.find(params[:guardarropa_id]).prendas_pies.sample

        if(@prenda_cabeza.nil? || @prenda_torso.nil? || @prenda_piernas.nil? ||  @prenda_pies.nil?)
            flash[:error]="No hay prendas de cada categoría suficientes :("
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
            flash[:success]="El atuendo se borró correctamente!"
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
        @guardarropa= Guardarropa.find_by(id: params[:guardarropa_id], user: current_user)
    end

    def UserValidado?
        @atuendo.user == current_user
      end
end
