class AddIsGroupToMemberCategories < ActiveRecord::Migration
  def change
    add_column :member_categories, :is_group, :boolean
  end
end
