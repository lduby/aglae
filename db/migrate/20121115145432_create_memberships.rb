class CreateMemberships < ActiveRecord::Migration
  def change
  	create_table :memberships do |t|
      t.references :member
      t.references :membership_type
      t.date :starts_at

      t.timestamps
    end
  end
end
