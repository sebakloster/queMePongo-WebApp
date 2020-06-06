class DropAtuendosTable < ActiveRecord::Migration[5.1]
  def up
    drop_table :atuendos
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
