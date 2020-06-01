class CreatePrendaTipo < ActiveRecord::Migration[5.1]
  def change
    create_table :prenda_tipos do |t|
      t.integer :categoria
      t.string :name
    end
  end
end
