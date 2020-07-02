class RemoveUserFromPrenda < ActiveRecord::Migration[5.1]
  def change
    remove_reference :prendas, :user, index: true
  end
end
