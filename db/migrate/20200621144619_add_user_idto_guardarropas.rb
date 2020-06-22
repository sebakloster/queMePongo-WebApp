class AddUserIdtoGuardarropas < ActiveRecord::Migration[5.1]
  def change
    add_reference :guardarropas, :user
  end
end
