class CreateGuardarropa < ActiveRecord::Migration[5.1]
  def change
    create_table :guardarropas do |t|
      t.string :name
    end
  end
end
