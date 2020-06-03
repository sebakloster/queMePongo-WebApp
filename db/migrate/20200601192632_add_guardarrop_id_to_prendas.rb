class AddGuardarropIdToPrendas < ActiveRecord::Migration[5.1]
  def change
    add_reference :prendas, :guardarropa
  end
end
