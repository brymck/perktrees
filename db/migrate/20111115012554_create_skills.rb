class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :name
      t.string :slug

      t.timestamps
    end
    add_index :skills, :slug
  end
end
