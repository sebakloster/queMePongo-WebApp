class AddPrendaTipoIdtoPrendas < ActiveRecord::Migration[5.1]
  def change
    add_reference :prendas, :prenda_tipo
  end
end
