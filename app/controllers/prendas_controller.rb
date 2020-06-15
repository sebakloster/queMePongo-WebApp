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

    if (prenda_params[:color_primario] != prenda_params[:color_secundario])
      @prenda=Prenda.create(prenda_params)
      @prenda.prenda_tipo_id = prenda_params[:prenda_tipo_id]
      @prenda.guardarropa_id = prenda_params[:guardarropa_id]
   

      if @prenda.save
        flash[:success]="La prenda se guardó correctamente!"
        redirect_to @prenda
      else
        flash[:error]="La prenda no se guardó :("
        render :new
      end
    else
    flash[:error]="Los colores deben ser distintos."
    redirect_to prendas_path
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
    @prenda = Prenda.find(params[:id])
    @guardarropa = Guardarropa.find(@prenda.guardarropa_id)
    Prenda.destroy(params[:id])
    redirect_to @guardarropa
  end

  private
    def prenda_params
      params.require(:prenda).permit(:tela, :color_primario, :color_secundario, :prenda_tipo_id, :guardarropa_id)
    end
end
