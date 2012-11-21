class CreateMemberCategories < ActiveRecord::Migration
  def change
  	create_table :member_categories do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
