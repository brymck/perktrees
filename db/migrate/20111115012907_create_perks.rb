class CreatePerks < ActiveRecord::Migration
  def change
    create_table :perks do |t|
      t.string :name
      t.text :description
      t.integer :ranks, default: 1
      t.references :skill
      t.integer :skill_points, default: 0
      t.string :slug

      t.timestamps
    end
    add_index :perks, :skill_id
    add_index :perks, :slug
  end
end
