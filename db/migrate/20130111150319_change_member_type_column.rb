class ChangeMemberTypeColumn < ActiveRecord::Migration
  def change
  	remove_column :members, :member_type
  	add_column :members, :member_category_id, :integer
  end
end
