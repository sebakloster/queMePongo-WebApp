class AtuendosController < ApplicationController
    def index
        
        @atuendos = Atuendo.all
        logger.info('-antes-');
        logger.info(@atuendos);
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
        
            @atuendos = Atuendo.joins("INNER JOIN prendas ON prendas.id = atuendos.cabeza_id AND prendas.guardarropa_id = 3")
        
            render :index
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

        @atuendo = Atuendo.create({
            cabeza_id: @prendas_cabeza_selected.id,
            torso_id: @prendas_torso_selected.id,
            piernas_id: @prendas_piernas_selected.id,
            pies_id: @prendas_pies_selected.id
        })

        if @atuendo.save
            flash[:success]="El atuendo se guardó correctamente!"
            render :show
        else
            flash[:error]="El atuendo no se guardó :("
            render :new
        end
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
        
        @atuendo = Atuendo.create(atuendos_params);
        if @atuendo.save
            flash[:success]="El atuendo se guardó correctamente!"
            redirect_to action: :index
        else
            flash[:error]="El atuendo no se guardó :("
            render :new
        end
    end

    def destroy
        Atuendo.destroy(params[:id])
        redirect_to action: :index
    end

    def atuendos_params
        params.require(:atuendo).permit(:guardarropa_id, :cabeza_id, :torso_id, :pies_id, :piernas_id, :etiqueta_estacion, :etiqueta_tiempo, :etiqueta_formalidad, :puntaje, :descripcion)
    end
end