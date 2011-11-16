class CreatePerksPrerequisites < ActiveRecord::Migration
  def change
    create_table :perks_prerequisites, id: false do |t|
      t.integer :perk_id
      t.integer :prerequisite_id
    end
    add_index :perks_prerequisites, [:perk_id, :prerequisite_id]
  end
end
