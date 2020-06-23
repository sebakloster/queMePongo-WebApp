class AddUserIdtoPrendas < ActiveRecord::Migration[5.1]
  def change
    add_reference :prendas, :user
  end
end
