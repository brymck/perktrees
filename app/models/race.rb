class Race < ActiveRecord::Base
  belongs_to :major_skill, class_name: "Skill", foreign_key: "major_skill_id"
  has_and_belongs_to_many :minor_skills, class_name: "Skill", join_table: "minor_skills_races", association_foreign_key: "skill_id"

  def skills
    [major_skill] + minor_skills
  end

  def skills_text
    skills.map do |skill|
      skill.id
    end.join(",")
  end

  def to_param
    slug
  end
end
