class CreateVoluntaryWorks < ActiveRecord::Migration
  def change
  	create_table :voluntary_works do |t|
      t.references :member
      t.references :event
      t.date :volunteered_at
      t.text :note

      t.timestamps
    end
  end
end
