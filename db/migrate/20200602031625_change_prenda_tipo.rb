class ChangePrendaTipo < ActiveRecord::Migration[5.1]
  def change
    remove_column :prenda_tipos, :name, :string
    add_column :prenda_tipos, :tipo , :integer
  end
end
