class CreateGameCopyChecks < ActiveRecord::Migration
  def change
    create_table :game_copy_checks do |t|
      t.date :date
      t.integer :game_copy_id
      t.string :comment

      t.timestamps
    end
  end
end
