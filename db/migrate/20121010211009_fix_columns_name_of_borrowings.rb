class FixColumnsNameOfBorrowings < ActiveRecord::Migration
  def change
    rename_column :borrowings, :outDate, :borrowed_at
    rename_column :borrowings, :backDate, :returned_at
  end
end
