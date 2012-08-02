class CreateGameCopies < ActiveRecord::Migration
  def change
    create_table :game_copies do |t|
      t.string :game_id
      t.date :purchase_date
      t.string :condition
      t.string :status
      t.float :RentPrice
      t.float :PurchasePrice
      t.string :location
      t.string :comment

      t.timestamps
    end
  end
end
