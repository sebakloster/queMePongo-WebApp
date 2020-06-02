class ChangePrendaTela < ActiveRecord::Migration[5.1]
  def change
    remove_column :prendas, :tela, :string
    add_column :prendas, :tela , :integer
  end
end
