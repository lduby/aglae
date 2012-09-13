class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.date :transaction_date
      t.float :amount
      t.timestamps
    end
  end
end
