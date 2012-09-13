class CreateOperations < ActiveRecord::Migration
  def change
    create_table :operations do |t|
      t.string :operation_type
      t.date :when_booked
      t.references :third_party
      t.references :member
      t.timestamps
    end
  end
end
