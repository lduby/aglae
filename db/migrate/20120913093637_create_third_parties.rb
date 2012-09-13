class CreateThirdParties < ActiveRecord::Migration
  def change
    create_table :third_parties do |t|
      t.string :name
      t.string :address
      t.string :zipcode
      t.string :city
      t.string :phone
      t.string :fax
      t.string :third_party_type
      t.timestamps
    end
  end
end
