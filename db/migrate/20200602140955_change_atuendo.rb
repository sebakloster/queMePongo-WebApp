class ChangeAtuendo < ActiveRecord::Migration[5.1]
  def change
    add_column :atuendos, :puntaje , :integer
    add_column :atuendos, :lista_etiquetas , :string
  end
end
