class AtuendosController < ApplicationController

    before_action :finder_guardarropa

    def index
        
        @atuendos = Atuendo.where("user_id = :user and guardarropa_id = :guardarropa",{user: current_user.id, guardarropa: params[:guardarropa_id]})

        if(!params[:etiqueta_estacion].blank?)
            @atuendos = @atuendos.where("etiqueta_estacion = :etiqueta", { etiqueta: Atuendo.etiqueta_estacions[params[:etiqueta_estacion]]})
        end

        if(!params[:etiqueta_formalidad].blank?)
            @atuendos= @atuendos.where("etiqueta_formalidad = :etiqueta", { etiqueta: Atuendo.etiqueta_formalidads[params[:etiqueta_formalidad]]})
        end

        if(!params[:etiqueta_tiempo].blank?)
            @atuendos = @atuendos.where("etiqueta_tiempo = :etiqueta", {etiqueta: Atuendo.etiqueta_tiempos[params[:etiqueta_tiempo]]})
        end
        
        @guardarropa = Guardarropa.find(params[:guardarropa_id])
        @estacion_selected = !params[:etiqueta_estacion].blank? ? params[:etiqueta_estacion] : nil;
        @tiempo_selected = !params[:etiqueta_tiempo].blank? ? params[:etiqueta_tiempo] : nil;
        @formalidad_selected = !params[:etiqueta_formalidad].blank? ? params[:etiqueta_formalidad] : nil;
    end

    def edit
        @prendas_cabeza = Prenda.where("prenda_tipo_id = ? AND guardarropa_id = ? AND user_id = ?", 1, params[:guardarropa_id], current_user.id)
        @prendas_torso = Prenda.where("prenda_tipo_id = ? AND guardarropa_id = ? AND user_id = ?", 2, params[:guardarropa_id],  current_user.id)
        @prendas_piernas = Prenda.where("prenda_tipo_id = ? AND guardarropa_id = ? AND user_id = ?", 3, params[:guardarropa_id],  current_user.id)
        @prendas_pies = Prenda.where("prenda_tipo_id = ? AND guardarropa_id = ? AND user_id = ?", 4, params[:guardarropa_id],  current_user.id)
        @atuendo = Atuendo.find(params[:id])
        if(@atuendo.user_id == current_user.id)
            @atuendo
        else
            render :index, status: 403
            flash[:error]="Ha ocurrido un error! :("
        end

    end

    def update
        @atuendo = Atuendo.find(params[:id])

        if(@atuendo.user_id = current_user.id)
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
        
        @prendas_cabeza = Prenda.where("prenda_tipo_id = ? AND guardarropa_id = ? AND user_id = ?", 1, params[:guardarropa_id], current_user.id)
        @prendas_torso = Prenda.where("prenda_tipo_id = ? AND guardarropa_id = ? AND user_id = ?", 2, params[:guardarropa_id], current_user.id)
        @prendas_piernas = Prenda.where("prenda_tipo_id = ? AND guardarropa_id = ? AND user_id = ?", 3, params[:guardarropa_id], current_user.id)
        @prendas_pies = Prenda.where("prenda_tipo_id = ? AND guardarropa_id = ? AND user_id = ?", 4, params[:guardarropa_id], current_user.id)

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

        if(@atuendo.user_id == current_user.id)
            @atuendo
        else
            render :index, status: 403
        end
    end

    def new
        @prendas_cabeza = Prenda.where("prenda_tipo_id = ? AND guardarropa_id = ? AND user_id = ?", 1, params[:guardarropa_id], current_user.id)
        @prendas_torso = Prenda.where("prenda_tipo_id = ? AND guardarropa_id = ? AND user_id = ?", 2, params[:guardarropa_id], current_user.id)
        @prendas_piernas = Prenda.where("prenda_tipo_id = ? AND guardarropa_id = ? AND user_id = ?", 3, params[:guardarropa_id], current_user.id)
        @prendas_pies = Prenda.where("prenda_tipo_id = ? AND guardarropa_id = ? AND user_id = ?", 4, params[:guardarropa_id], current_user.id)
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
        @atuendo= Atuendo.find(params[:id])

        if(@atuendo.user_id == current_user.id)
            Atuendo.destroy(params[:id])
            redirect_to action: :index
        else
            render :index, status: 403
        end
        
    end

    private
    def atuendos_params
        params.require(:atuendo).permit( :cabeza_id, :torso_id, :pies_id, :piernas_id, :etiqueta_estacion, :etiqueta_tiempo, :etiqueta_formalidad, :puntaje, :descripcion, :user_id, :nombre)
    end

    def finder_guardarropa
    @guardarropa= Guardarropa.find(params[:guardarropa_id])
    end
end
