# Skills
alteration  = Skill.create(name: "Alteration")
conjuration = Skill.create(name: "Conjuration")
destruction = Skill.create(name: "Destruction")
enchanting  = Skill.create(name: "Enchanting")
illusion    = Skill.create(name: "Illusion")
restoration = Skill.create(name: "Restoration")
archery     = Skill.create(name: "Archery")
block       = Skill.create(name: "Block")
heavy_armor = Skill.create(name: "Heavy Armor")
one_handed  = Skill.create(name: "One-handed")
smithing    = Skill.create(name: "Smithing")
two_handed  = Skill.create(name: "Two-handed")
alchemy     = Skill.create(name: "Alchemy")
light_armor = Skill.create(name: "Light Armor")
lockpicking = Skill.create(name: "Lockpicking")
pickpocket  = Skill.create(name: "Pickpocket")
sneak       = Skill.create(name: "Sneak")
speech      = Skill.create(name: "Speech")

# Races
Altmer = Race.create(
  name: "Altmer",
  major_skill: illusion,
  minor_skills: [alteration, conjuration, destruction, enchanting, restoration]
)
Argonian = Race.create(
  name: "Argonian",
  major_skill: lockpicking,
  minor_skills: [alteration, light_armor, pickpocket, restoration, sneak]
)
Bosmer = Race.create(
  name: "Bosmer",
  major_skill: archery,
  minor_skills: [alchemy, light_armor, lockpicking, pickpocket, sneak]
)
Breton = Race.create(
  name: "Breton",
  major_skill: conjuration,
  minor_skills: [alchemy, alteration, illusion, restoration, speech]
)
Dunmer = Race.create(
  name: "Dunmer",
  major_skill: destruction,
  minor_skills: [alchemy, alteration, illusion, light_armor, sneak]
)
Imperial = Race.create(
  name: "Imperial",
  major_skill: restoration,
  minor_skills: [block, destruction, enchanting, heavy_armor, one_handed]
)
Khajiit = Race.create(
  name: "Khajiit",
  major_skill: sneak,
  minor_skills: [alchemy, archery, lockpicking, pickpocket, one_handed]
)
Nord = Race.create(
  name: "Nord",
  major_skill: two_handed,
  minor_skills: [block, light_armor, one_handed, smithing, speech]
)
Orc = Race.create(
  name: "Orc",
  major_skill: heavy_armor,
  minor_skills: [block, enchanting, one_handed, smithing, two_handed]
)
Redguard = Race.create(
  name: "Redguard",
  major_skill: one_handed,
  minor_skills: [alteration, archery, block, destruction, smithing]
)

# Alteration
novice_alteration = Perk.create(
  name: "Novice Alteration",
  description: "Cast Novice level Alteration spells for half magicka",
  skill: alteration
)
alteration_dual_casting = Perk.create(
  name: "Alteration Dual Casting",
  description: "Dual casting an Alteration spell overcharges the effects into an even more powerful version",
  skill: alteration,
  prerequisites: [novice_alteration]
)
