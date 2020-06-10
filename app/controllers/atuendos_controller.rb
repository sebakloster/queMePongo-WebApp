class AtuendosController < ApplicationController
    
    def new
        @prendas_cabeza = Prenda.where("prenda_tipo_id = ? AND guardarropa_id = ?", 1, params[:guardarropa_id])
        @prendas_torso = Prenda.where("prenda_tipo_id = ? AND guardarropa_id = ?", 2, params[:guardarropa_id])
        @prendas_piernas = Prenda.where("prenda_tipo_id = ? AND guardarropa_id = ?", 3, params[:guardarropa_id])
        @prendas_pies = Prenda.where("prenda_tipo_id = ? AND guardarropa_id = ?", 4, params[:guardarropa_id])
      @atuendo= Atuendo.new
    end

    def show
        @atuendo = Atuendo.find(params[:id])
      end

    def create
        logger.info(@params);
        @atuendo = Atuendo.create(atuendos_params);
        if @atuendo.save
            flash[:success]="El atuendo se guardó correctamente!"
            redirect_to @atuendo
        else
            flash[:error]="El atuendo no se guardó :("
            render :new
        end
    end

    def atuendos_params
        params.require(:atuendo).permit(:guardarropa_id, :cabeza_id, :torso_id, :pies_id, :piernas_id)
    end
end