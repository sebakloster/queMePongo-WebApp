module PrendaHelper
  def prenda_link(prenda)
    link_to "Ir a prenda", prenda_path(prenda)
  end
end
