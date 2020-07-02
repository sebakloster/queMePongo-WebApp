class RemoveUserFromAtuendo < ActiveRecord::Migration[5.1]
 def change
    remove_reference :atuendos, :user, index: true
  end
end
