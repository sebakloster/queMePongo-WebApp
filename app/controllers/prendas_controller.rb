class PrendasController < ApplicationController
  def new
    @prenda= Prenda.new
  end

  def edit
    @prenda = Prenda.find(params[:id])
  end

  def index
    @prendas = Prenda.all
  end

  def show
    @prenda = Prenda.find(params[:id])
  end

  def create
  #  logger.info(params[:prenda][:prenda_tipo_id])
    @prenda=Prenda.create(prenda_params);
    @prenda.prenda_tipo = PrendaTipo.find(prenda_tipo_params.to_h[:prenda_tipo_id])
    @prenda.guardarropa = Guardarropa.find(guardarropa_params.to_h[:guardarropa_id])
    if @prenda.save
      flash[:success]="La prenda se guardó correctamente!"
      redirect_to @prenda
    else
      flash[:error]="La prenda no se guardó :("
      render :new
    end
  end

  def update
    @prenda = Prenda.find(params[:id])

    if @prenda.update(prenda_params)
      flash[:success]="La prenda se actualizó correctamente!"
      redirect_to @prenda
    else
      flash[:error]="La prenda no se actualizó :("
      render :edit
    end
  end

  def destroy
    Prenda.destroy(params[:id])
    redirect_to action: :index
  end

  private
    def prenda_params
      params.require(:prenda).permit(:tela, :color_primario, :color_secundario)
    end
    private
    def prenda_tipo_params
      params.require(:prenda).permit(:prenda_tipo_id)
    end
    def guardarropa_params
      params.require(:prenda).permit(:guardarropa_id)
    end
end
