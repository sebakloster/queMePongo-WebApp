class AddNombreAtuendos < ActiveRecord::Migration[5.1]
  def change
    add_column :atuendos, :nombre, :string
  end
end
