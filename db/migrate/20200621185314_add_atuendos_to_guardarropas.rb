class AddAtuendosToGuardarropas < ActiveRecord::Migration[5.1]
  def change
    add_reference :atuendos, :guardarropa
  end
end
