class CreateGamePieces < ActiveRecord::Migration
  def change
    create_table :game_pieces do |t|
      t.integer :game_id
      t.string :label
      t.integer :order

      t.timestamps
    end
  end
end
