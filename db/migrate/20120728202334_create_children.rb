class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.integer :member_id
      t.string :lastname
      t.string :firstname
      t.date :birthdate
      t.string :sex

      t.timestamps
    end
  end
end
