class RemoveUserFromAtuendo < ActiveRecord::Migration[5.1]
 def change
    remove_reference :atuendos, :user, index: true, foreign_key: true
  end
end
