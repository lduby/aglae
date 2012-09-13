class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.references :account
      t.float :amount
      t.text :description
      t.boolean :debit
      t.boolean :credit
      t.date :when_occured
      t.date :when_recorded
      t.timestamps
    end
  end
end
