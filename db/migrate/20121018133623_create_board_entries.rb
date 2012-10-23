class CreateBoardEntries < ActiveRecord::Migration
  def change
  	create_table :board_entries do |t|
      t.references :member
      t.date :entered_at
      t.date :left_at
      t.string :title

      t.timestamps
    end
  end
end
