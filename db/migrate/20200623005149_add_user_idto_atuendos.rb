class AddUserIdtoAtuendos < ActiveRecord::Migration[5.1]
  def change
    add_reference :atuendos, :user
  end
end
