class AtuendosController < ApplicationController
    before_action :finder_guardarropa, :require_user
    before_action :validar_usuario, only: [:show, :edit, :update, :destroy]
    
    def index
        @atuendos=Atuendo.where(guardarropa: @guardarropa).paginate(page: params[:page], per_page: 3)
        @atuendos= @atuendos.filter_by_estacion(params[:etiqueta_estacion].presence).filter_by_formalidad(params[:etiqueta_formalidad].presence).filter_by_tiempo(params[:etiqueta_tiempo].presence).ordered_by_puntaje(params[:orden_puntaje].presence)
        filter_memory
    end
    
    def edit 
        asignar_partes
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
        @prenda_cabeza = Guardarropa.find(params[:guardarropa_id]).prendas_cabeza.sample
        @prenda_torso = Guardarropa.find(params[:guardarropa_id]).prendas_torso.sample
        @prenda_piernas = Guardarropa.find(params[:guardarropa_id]).prendas_piernas.sample
        @prenda_pies = Guardarropa.find(params[:guardarropa_id]).prendas_pies.sample

        if @prenda_cabeza.nil? || @prenda_torso.nil? || @prenda_piernas.nil? ||  @prenda_pies.nil?
            flash[:error]="No hay prendas de cada categoría suficientes :("
            @guardarropa = Guardarropa.find(params[:guardarropa_id])
            redirect_to @guardarropa
        end
        @atuendo= Atuendo.new
    end

    def show
        @atuendo= Atuendo.find(params[:id])
    end

    def new
        asignar_partes
        @atuendo= Atuendo.new
    end

    def create
        @atuendo = Atuendo.new(atuendos_params);
        @atuendo.guardarropa = @guardarropa      
        if @atuendo.save
            flash[:success]="El atuendo se guardó correctamente!"
            if params[:atuendo][:from_generate].blank?
                redirect_to action: :index
            else
                render :generated
            end   
        else
            flash[:error]="Asegurate de tener una prenda de cada categoria :("
            asignar_partes
            render :new
        end
    end

    def destroy
        @atuendo= Atuendo.find(params[:id])
        Atuendo.destroy(params[:id])
        flash[:success]="El atuendo se borró correctamente!"
        redirect_to action: :index
    end

    private
    def atuendos_params
        params.require(:atuendo).permit( :cabeza_id, :torso_id, :pies_id, :piernas_id, :etiqueta_estacion, :etiqueta_tiempo, :etiqueta_formalidad, :puntaje, :descripcion, :nombre )
    end

    def finder_guardarropa
        @guardarropa= Guardarropa.find_by(id: params[:guardarropa_id], user: current_user)
    end

    def validar_usuario
        if !(Atuendo.find(params[:id]).user == current_user)
            render :index, status: 403
        end
    end
    
    def filter_memory
        @estacion_selected = params[:etiqueta_estacion].presence;
        @tiempo_selected = params[:etiqueta_tiempo].presence;
        @formalidad_selected = params[:etiqueta_formalidad].presence;
        @order_puntaje = params[:orden_puntaje].presence;
    end

    def asignar_partes
        @prendas_cabeza = Guardarropa.find(params[:guardarropa_id]).prendas_cabeza 
        @prendas_torso = Guardarropa.find(params[:guardarropa_id]).prendas_torso 
        @prendas_piernas = Guardarropa.find(params[:guardarropa_id]).prendas_piernas 
        @prendas_pies = Guardarropa.find(params[:guardarropa_id]).prendas_pies 
    end
end
