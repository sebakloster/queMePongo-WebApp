class ChangePrendas < ActiveRecord::Migration[5.1]
  def change
    remove_column :prendas, :categoria, :integer
  end
end
