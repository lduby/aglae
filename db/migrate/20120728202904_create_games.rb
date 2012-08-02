class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.string :description
      t.string :manufacturer
      t.string :supplier
      t.string :min_age
      t.integer :min_nb_player
      t.integer :max_nb_player
      t.string :average_length
      t.string :category
      t.string :type
      t.string :rule
      t.string :picture

      t.timestamps
    end
    add_index :games, :manufacturer
  end
end
