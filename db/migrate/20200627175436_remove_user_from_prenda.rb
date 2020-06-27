class RemoveUserFromPrenda < ActiveRecord::Migration[5.1]
  def change
    remove_reference :prendas, :user, index: true, foreign_key: true
  end
end
