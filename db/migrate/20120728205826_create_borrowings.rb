class CreateBorrowings < ActiveRecord::Migration
  def change
    create_table :borrowings do |t|
      t.date :outDate
      t.date :backDate
      t.integer :member_id
      t.integer :game_copy_id
      t.integer :child_id

      t.timestamps
    end
  end
end
