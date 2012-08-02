class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :lastname
      t.string :firstname
      t.string :member_type
      t.string :organization
      t.string :address
      t.string :zipcode
      t.string :city
      t.string :phone
      t.string :occupation
      t.date :birthdate

      t.timestamps
    end
    add_index :members, :lastname
    add_index :members, :firstname
    add_index :members, :organization
    add_index :members, :zipcode
    add_index :members, :city
  end
end
