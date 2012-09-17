class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles, :id => false do |t|
      t.references :member, :user

      t.timestamps
    end
    add_index(:profiles, [ :member_id, :user_id ])
  end
end
