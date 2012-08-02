class CreateGameCopyContents < ActiveRecord::Migration
  def change
    create_table :game_copy_contents do |t|
      t.integer :game_copy_id
      t.integer :game_piece_id
      t.string :condition
      t.string :comment
      t.boolean :is_missing

      t.timestamps
    end
  end
end
