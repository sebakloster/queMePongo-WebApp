class PrendasController < ApplicationController

  def new
    @prenda= Prenda.new
  end

  def edit
    @prenda = Prenda.find(params[:id])
    if(UserValidado?)
      @prenda
    else
      flash[:error]="Ha ocurrido un error! :("
      render :index, status: 403
    end
  end

  def create

    if (prenda_params[:color_primario] != prenda_params[:color_secundario])

      @prenda=Prenda.create(prenda_params)
      @prenda.user = current_user
   
      if @prenda.save
        flash[:success]="La prenda se guardó correctamente!"
        @guardarropa = Guardarropa.find(prenda_params[:guardarropa_id])
        redirect_to @guardarropa
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
    
    if(UserValidado?)
      if @prenda.update(prenda_params)
        flash[:success]="La prenda se actualizó correctamente!"
        redirect_to guardarropas_path
      else
        flash[:error]="La prenda no se actualizó :("
        render :edit
      end
    else
      flash[:error]="Ha ocurrido un error! :("
      render :index, status: 403
    end

  end

  def destroy
    @prenda = Prenda.find(params[:id])

    if(UserValidado?)
      @guardarropa = Guardarropa.find(@prenda.guardarropa_id)
      Prenda.destroy(params[:id])
      redirect_to @guardarropa
    else
      flash[:error]="Ha ocurrido un error! :("
      render :index, status: 403
    end

  end

  private
    def prenda_params
      params.require(:prenda).permit(:tela, :color_primario, :color_secundario, :prenda_tipo_id, :guardarropa_id)
    end

    def UserValidado?
      @prenda.user == current_user
    end
end
