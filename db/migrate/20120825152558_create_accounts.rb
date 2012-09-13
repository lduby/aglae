class CreateAccounts < ActiveRecord::Migration
  def change
  	create_table :accounts do |t|
      t.string :country
      t.string :code
      t.string :title
      t.boolean :class_account
      t.boolean :orphan
      t.text :note
      t.boolean :inactive
      t.boolean :provided
      t.timestamps
  	end
  end
end
