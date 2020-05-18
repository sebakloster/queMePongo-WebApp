class CrearPrenda < ActiveRecord::Migration[5.1]
  def change
    create_table :prendas do |t|
      t.integer :categoria
      t.integer :tipo
      t.string  :tela
      t.string :color_primario
      t.string :color_secundario
    end
  end
end
