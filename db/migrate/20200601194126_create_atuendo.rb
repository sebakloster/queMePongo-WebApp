class CreateAtuendo < ActiveRecord::Migration[5.1]
  def change
    create_table :atuendos do |t|
      t.references :prenda_torso
      t.references :prenda_cabeza
      t.references :prenda_piernas
      t.references :prenda_pies
    end
  end
end
