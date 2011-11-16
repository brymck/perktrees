class CreateRaces < ActiveRecord::Migration
  def change
    create_table :races do |t|
      t.string :name
      t.references :major_skill

      t.timestamps
    end
    add_index :races, :major_skill_id

    create_table :minor_skills_races, id: false do |t|
      t.integer :skill_id
      t.integer :race_id
    end
    add_index :minor_skills_races, [:skill_id, :race_id]
  end
end
