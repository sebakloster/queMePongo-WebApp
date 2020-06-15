class FixAtuendo < ActiveRecord::Migration[5.1]
  def change
    add_column :atuendos, :etiqueta_estacion, :integer
    add_column :atuendos, :etiqueta_tiempo, :integer
    add_column :atuendos, :etiqueta_formalidad, :integer
    add_column :atuendos, :descripcion, :text
    remove_column :atuendos, :etiquetas, :string
  end
end

