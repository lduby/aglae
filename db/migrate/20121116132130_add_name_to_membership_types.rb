class AddNameToMembershipTypes < ActiveRecord::Migration
  def change
    add_column :membership_types, :name, :string
  end
end
