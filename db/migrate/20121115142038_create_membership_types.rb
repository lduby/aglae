class CreateMembershipTypes < ActiveRecord::Migration
  def change
  	create_table :membership_types do |t|
      t.references :member_category
      t.boolean :is_for_local
      t.integer :duration
      t.float :fee
      t.text :description

      t.timestamps
    end
  end
end
