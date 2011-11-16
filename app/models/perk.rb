class Perk < ActiveRecord::Base
  belongs_to :skill
  has_and_belongs_to_many :prerequisites, class_name: "Perk", join_table: "perks_prerequisites", foreign_key: "perk_id", association_foreign_key: "prerequisite_id"
end
