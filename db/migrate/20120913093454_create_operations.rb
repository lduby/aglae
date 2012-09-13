class CreateOperations < ActiveRecord::Migration
  def change
    create_table :operations do |t|
      t.references :operationable, :polymorphic => true
      t.date :when_booked
      t.timestamps
    end
  end
end
