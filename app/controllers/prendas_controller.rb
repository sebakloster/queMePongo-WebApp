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
    @prenda=Prenda.create(prenda_params);
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
    redirect_to @prenda
  end

  private
    def prenda_params
      params.require(:prenda).permit(:categoria, :tipo, :color_primario, :color_secundario, :tela)
    end
end
