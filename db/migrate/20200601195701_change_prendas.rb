class ChangePrendas < ActiveRecord::Migration[5.1]
  def change
    remove_column :prendas, :tipo, :integer
  end
end
