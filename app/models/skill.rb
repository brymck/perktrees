class Skill < ActiveRecord::Base
  has_many :perks
  has_many :major_races, class_name: "Race", foreign_key: "major_skill_id"
  has_and_belongs_to_many :minor_races, class_name: "Race", join_table: "minor_skills_races", foreign_key: "skill_id"

  def races
    major_races + minor_races
  end
end
