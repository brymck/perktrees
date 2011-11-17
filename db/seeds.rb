# Skills
alteration  = Skill.create(name: "Alteration",  slug: "alteration")
conjuration = Skill.create(name: "Conjuration", slug: "conjuration")
destruction = Skill.create(name: "Destruction", slug: "destruction")
enchanting  = Skill.create(name: "Enchanting",  slug: "enchanting")
illusion    = Skill.create(name: "Illusion",    slug: "illusion")
restoration = Skill.create(name: "Restoration", slug: "restoration")
archery     = Skill.create(name: "Archery",     slug: "archery")
block       = Skill.create(name: "Block",       slug: "block")
heavy_armor = Skill.create(name: "Heavy Armor", slug: "heavy_armor")
one_handed  = Skill.create(name: "One-handed",  slug: "one_handed")
smithing    = Skill.create(name: "Smithing",    slug: "smithing")
two_handed  = Skill.create(name: "Two-handed",  slug: "two_handed")
alchemy     = Skill.create(name: "Alchemy",     slug: "alchemy")
light_armor = Skill.create(name: "Light Armor", slug: "light_armor")
lockpicking = Skill.create(name: "Lockpicking", slug: "lockpicking")
pickpocket  = Skill.create(name: "Pickpocket",  slug: "pickpocket")
sneak       = Skill.create(name: "Sneak",       slug: "sneak")
speech      = Skill.create(name: "Speech",      slug: "speech")

# Races
Altmer = Race.create(
  name: "Altmer",
  major_skill: illusion,
  minor_skills: [alteration, conjuration, destruction, enchanting, restoration],
  slug: "altmer"
)
Argonian = Race.create(
  name: "Argonian",
  major_skill: lockpicking,
  minor_skills: [alteration, light_armor, pickpocket, restoration, sneak],
  slug: "argonian"
)
Bosmer = Race.create(
  name: "Bosmer",
  major_skill: archery,
  minor_skills: [alchemy, light_armor, lockpicking, pickpocket, sneak],
  slug: "bosmer"
)
Breton = Race.create(
  name: "Breton",
  major_skill: conjuration,
  minor_skills: [alchemy, alteration, illusion, restoration, speech],
  slug: "breton"
)
Dunmer = Race.create(
  name: "Dunmer",
  major_skill: destruction,
  minor_skills: [alchemy, alteration, illusion, light_armor, sneak],
  slug: "dunmer"
)
Imperial = Race.create(
  name: "Imperial",
  major_skill: restoration,
  minor_skills: [block, destruction, enchanting, heavy_armor, one_handed],
  slug: "imperial"
)
Khajiit = Race.create(
  name: "Khajiit",
  major_skill: sneak,
  minor_skills: [alchemy, archery, lockpicking, pickpocket, one_handed],
  slug: "khajiit"
)
Nord = Race.create(
  name: "Nord",
  major_skill: two_handed,
  minor_skills: [block, light_armor, one_handed, smithing, speech],
  slug: "nord"
)
Orc = Race.create(
  name: "Orc",
  major_skill: heavy_armor,
  minor_skills: [block, enchanting, one_handed, smithing, two_handed],
  slug: "orc"
)
Redguard = Race.create(
  name: "Redguard",
  major_skill: one_handed,
  minor_skills: [alteration, archery, block, destruction, smithing],
  slug: "redguard"
)

# Perks
overdraw = Perk.create(
  name: "Overdraw",
  description: "Bows do 20% more damage.(+20% per additional rank)",
  skill: archery,
  ranks: 5
)
eagle_eye = Perk.create(
  name: "Eagle Eye",
  description: "Pressing Block while aiming will zoom in your view",
  skill: archery,
  skill_points: 30,
  prerequisites: [overdraw]
)
critical_shot = Perk.create(
  name: "Critical Shot",
  description: "10% chance of a critical hit that does extra damage (+5% per additional rank)",
  skill: archery,
  skill_points: 30,
  ranks: 3,
  prerequisites: [overdraw]
)
steady_hand = Perk.create(
  name: "Steady Hand",
  description: "Zooming in with a bow slows time by 25% (50% for second rank)",
  skill: archery,
  skill_points: 40,
  ranks: 2,
  prerequisites: [eagle_eye]
)
power_shot = Perk.create(
  name: "Power Shot",
  description: "Arrows stagger all but the largest opponents 50% of the time",
  skill: archery,
  skill_points: 50,
  prerequisites: [eagle_eye]
)
hunters_discipline = Perk.create(
  name: "Hunter's Discipline",
  description: "Recover twice as many arrows from dead bodies",
  skill: archery,
  skill_points: 50,
  prerequisites: [critical_shot]
)
ranger = Perk.create(
  name: "Ranger",
  description: "Able to move faster with a drawn bow",
  skill: archery,
  skill_points: 60,
  prerequisites: [hunters_discipline]
)
quick_shot = Perk.create(
  name: "Quick Shot",
  description: "Can draw a bow 30% faster",
  skill: archery,
  skill_points: 70,
  prerequisites: [power_shot]
)
bullseye = Perk.create(
  name: "Bullseye",
  description: "15% chance of paralyzing the target for a few seconds",
  skill: archery,
  skill_points: 100,
  prerequisites: [quick_shot, ranger]
)
shield_wall = Perk.create(
  name: "Shield Wall",
  description: "Blocking is 20% more effective (+5% per additional rank)",
  skill: block,
  ranks: 5
)
deflect_arrows = Perk.create(
  name: "Deflect Arrows",
  description: "Arrows that hit the shield do no damage",
  skill: block,
  skill_points: 30,
  prerequisites: [shield_wall]
)
quick_reflexes = Perk.create(
  name: "Quick Reflexes",
  description: "Time slows down if you are blocking during an enemy's power attack",
  skill: block,
  skill_points: 30,
  prerequisites: [shield_wall]
)
power_bash = Perk.create(
  name: "Power Bash",
  description: "Able to do a power bash",
  skill: block,
  skill_points: 30,
  prerequisites: [shield_wall]
)
elemental_protection = Perk.create(
  name: "Elemental Protection",
  description: "Blocking with a shield reduces incoming fire, frost and shock damage by 50%",
  skill: block,
  skill_points: 50,
  prerequisites: [deflect_arrows]
)
deadly_bash = Perk.create(
  name: "Deadly Bash",
  description: "Bashing does five times more damage",
  skill: block,
  skill_points: 50,
  prerequisites: [power_bash]
)
block_runner = Perk.create(
  name: "Block Runner",
  description: "Able to move faster with a shield raised",
  skill: block,
  skill_points: 70,
  prerequisites: [elemental_protection]
)
disarming_bash = Perk.create(
  name: "Disarming Bash",
  description: "Chance to disarm when power bashing",
  skill: block,
  skill_points: 70,
  prerequisites: [deadly_bash]
)
shield_charge = Perk.create(
  name: "Shield Charge",
  description: "Sprinting with a shield raised knocks down most targets",
  skill: block,
  skill_points: 100,
  prerequisites: [block_runner, disarming_bash]
)
juggernaut = Perk.create(
  name: "Juggernaut",
  description: "Increases armor rating for Heavy Armor by 20% (+20% per additional rank)",
  skill: heavy_armor,
  ranks: 5
)
fists_of_steel = Perk.create(
  name: "Fists of Steel",
  description: "Unarmed attacks with Heavy Armor gaunlets do their armor rating in extra damage",
  skill: heavy_armor,
  skill_points: 30,
  prerequisites: [juggernaut]
)
well_fitted = Perk.create(
  name: "Well Fitted",
  description: "25% armor bonus if wearing all Heavy Armor: head, chest, hands, feet",
  skill: heavy_armor,
  skill_points: 30,
  prerequisites: [juggernaut]
)
cushioned = Perk.create(
  name: "Cushioned",
  description: "Half damage from falling if wearing all Heavy Armor: head, chest, hands, feet",
  skill: heavy_armor,
  skill_points: 50,
  prerequisites: [fists_of_steel]
)
tower_of_strength = Perk.create(
  name: "Tower of Strength",
  description: "50% less stagger when wearing only Heavy Armor",
  skill: heavy_armor,
  skill_points: 50,
  prerequisites: [well_fitted]
)
conditioning = Perk.create(
  name: "Conditioning",
  description: "Heavy Armor weighs nothing and doesn't slow you down when worn",
  skill: heavy_armor,
  skill_points: 70,
  prerequisites: [cushioned]
)
matching_set = Perk.create(
  name: "Matching Set",
  description: "Additional 25% armor bonus if wearing a matched set of Heavy Armor",
  skill: heavy_armor,
  skill_points: 70,
  prerequisites: [tower_of_strength]
)
reflect_blows = Perk.create(
  name: "Reflect Blows",
  description: "10% chance to reflect melee damage back to the enemy while wearing all Heavy Armor: head, chest, hands, feet",
  skill: heavy_armor,
  skill_points: 100,
  prerequisites: [matching_set]
)
armsman = Perk.create(
  name: "Armsman",
  description: "One-Handed weapons do 20% more damage (+20% per additional rank)",
  skill: one_handed,
  ranks: 5
)
fighting_stance = Perk.create(
  name: "Fighting Stance",
  description: "Power attacks with one-handed weapons cost 20% less stamina",
  skill: one_handed,
  skill_points: 20,
  prerequisites: [armsman]
)
hack_and_slash = Perk.create(
  name: "Hack and Slash",
  description: "Attacks with war axes cause extra bleeding damage (Additional ranks raise the bleeding damage)",
  skill: one_handed,
  skill_points: 30,
  ranks: 3,
  prerequisites: [armsman]
)
bone_breaker = Perk.create(
  name: "Bone Breaker",
  description: "Attacks with maces ignore 25% of armor (+25% per additional rank)",
  skill: one_handed,
  skill_points: 30,
  ranks: 3,
  prerequisites: [armsman]
)
bladesman = Perk.create(
  name: "Bladesman",
  description: "Attacks with swords have a 10% chance of doing critical damage (+5% per additional rank)",
  skill: one_handed,
  skill_points: 30,
  ranks: 3,
  prerequisites: [armsman]
)
dual_flurry = Perk.create(
  name: "Dual Flurry",
  description: "Dual wielding attacks are 20% faster (35% for second rank)",
  skill: one_handed,
  skill_points: 30,
  ranks: 2,
  prerequisites: [armsman]
)
savage_strike = Perk.create(
  name: "Savage Strike",
  description: "Standing power attacks do 25% bonus damage with a chance to decapitate your enemies",
  skill: one_handed,
  skill_points: 50,
  prerequisites: [fighting_stance]
)
critical_charge = Perk.create(
  name: "Critical Charge",
  description: "Can do a one-handed power attack while sprinting that does double critical damage",
  skill: one_handed,
  skill_points: 50,
  prerequisites: [fighting_stance]
)
dual_savagery = Perk.create(
  name: "Dual Savagery",
  description: "Dual wielding power attacks do 50% bonus damage",
  skill: one_handed,
  skill_points: 70,
  prerequisites: [dual_flurry]
)
paralyzing_strike = Perk.create(
  name: "Paralyzing Strike",
  description: "Backwards power attack has a 25% chance to paralyze the target",
  skill: one_handed,
  skill_points: 100,
  prerequisites: [savage_strike, critical_charge]
)
barbarian = Perk.create(
  name: "Barbarian",
  description: "Two-Handed weapons do 20% more damage (+20% per additional rank)",
  skill: two_handed,
  ranks: 5
)
champions_stance = Perk.create(
  name: "Champion's Stance",
  description: "Power attacks with two-handed weapons cost 25% less stamina",
  skill: two_handed,
  skill_points: 20,
  prerequisites: [barbarian]
)
limbsplitter = Perk.create(
  name: "Limbsplitter",
  description: "Attacks with battle axes cause extra bleeding damage (Additional ranks raise the bleeding damage)",
  skill: two_handed,
  skill_points: 30,
  ranks: 3,
  prerequisites: [barbarian]
)
deep_wounds = Perk.create(
  name: "Deep Wounds",
  description: "Attacks with greatswords have a 10% chance of doing critical damage (+5% per additional rank)",
  skill: two_handed,
  skill_points: 30,
  ranks: 3,
  prerequisites: [barbarian]
)
skullcrusher = Perk.create(
  name: "Skullcrusher",
  description: "Attacks with warhammers ignore 25% of armor (+25% per additional rank)",
  skill: two_handed,
  skill_points: 30,
  ranks: 3,
  prerequisites: [barbarian]
)
devastating_blow = Perk.create(
  name: "Devastating Blow",
  description: "Standing power attacks do 25% bonus damage with a chance to decapitate your enemies",
  skill: two_handed,
  skill_points: 50,
  prerequisites: [champions_stance]
)
great_critical_charge = Perk.create(
  name: "Great Critical Charge",
  description: "Can do a two-handed power attack while sprinting that does double critical damage",
  skill: two_handed,
  skill_points: 50,
  prerequisites: [champions_stance]
)
sweep = Perk.create(
  name: "Sweep",
  description: "Sideways power attacks with two-handed weapons hit all targets in front of you",
  skill: two_handed,
  skill_points: 70,
  prerequisites: [devastating_blow, great_critical_charge]
)
warmaster = Perk.create(
  name: "Warmaster",
  description: "Backwards power attack has a 25% chance to paralyze the target",
  skill: two_handed,
  skill_points: 100,
  prerequisites: [sweep]
)
steel_smithing = Perk.create(
  name: "Steel Smithing",
  description: "Can create Steel armor and weapons at forges, and improve them twice as much",
  skill: smithing
)
elven_smithing = Perk.create(
  name: "Elven Smithing",
  description: "Can create Elven armor and weapons at forges, and improve them twice as much",
  skill: smithing,
  skill_points: 30,
  prerequisites: [steel_smithing]
)
dwarven_smithing = Perk.create(
  name: "Dwarven Smithing",
  description: "Can create Dwarven armor and weapons at forges, and improve them twice as much",
  skill: smithing,
  skill_points: 30,
  prerequisites: [steel_smithing]
)
advanced_armors = Perk.create(
  name: "Advanced Armors",
  description: "Can create Scaled and Plate armor at forges, and improve them twice as much",
  skill: smithing,
  skill_points: 50,
  prerequisites: [elven_smithing]
)
orcish_smithing = Perk.create(
  name: "Orcish Smithing",
  description: "Can create Orcish armor and weapons at forges, and improve them twice as much",
  skill: smithing,
  skill_points: 50,
  prerequisites: [dwarven_smithing]
)
arcane_blacksmith = Perk.create(
  name: "Arcane Blacksmith",
  description: "You can improve magical weapons and armor",
  skill: smithing,
  skill_points: 60,
  prerequisites: [steel_smithing]
)
glass_smithing = Perk.create(
  name: "Glass Smithing",
  description: "Can create Glass armor and weapons at forges, and improve them twice as much",
  skill: smithing,
  skill_points: 70,
  prerequisites: [elven_smithing]
)
ebony_smithing = Perk.create(
  name: "Ebony Smithing",
  description: "Can create Ebony armor and weapons at forges, and improve them twice as much",
  skill: smithing,
  skill_points: 80,
  prerequisites: [orcish_smithing]
)
daedric_smithing = Perk.create(
  name: "Daedric Smithing",
  description: "Can create Daedric armor and weapons at forges, and improve them twice as much",
  skill: smithing,
  skill_points: 90,
  prerequisites: [ebony_smithing]
)
dragon_armor = Perk.create(
  name: "Dragon Armor",
  description: "Can create Dragon armor at forges, and improve them twice as much",
  skill: smithing,
  skill_points: 100,
  prerequisites: [glass_smithing, daedric_smithing]
)
novice_alteration = Perk.create(
  name: "Novice Alteration",
  description: "Cast Novice level Alteration spells for half magicka",
  skill: alteration
)
alteration_dual_casting = Perk.create(
  name: "Alteration Dual Casting",
  description: "Dual casting an Alteration spell overcharges the effects into an even more powerful version",
  skill: alteration,
  skill_points: 20,
  prerequisites: [novice_alteration]
)
apprentice_alteration = Perk.create(
  name: "Apprentice Alteration",
  description: "Cast Apprentice level Alteration spells for half magicka",
  skill: alteration,
  skill_points: 25,
  prerequisites: [novice_alteration]
)
mage_armor = Perk.create(
  name: "Mage Armor",
  description: "Protection spells like Stoneflesh are 2x as strong if not wearing armor (+.5x per additional rank)",
  skill: alteration,
  skill_points: 30,
  ranks: 3,
  prerequisites: [apprentice_alteration]
)
magic_resistance = Perk.create(
  name: "Magic Resistance",
  description: "Blocks 10% of a spells effect (+10% per additional rank)",
  skill: alteration,
  skill_points: 30,
  ranks: 3,
  prerequisites: [apprentice_alteration]
)
adept_alteration = Perk.create(
  name: "Adept Alteration",
  description: "Cast Adept level Alteration spells for half magicka",
  skill: alteration,
  skill_points: 50,
  prerequisites: [apprentice_alteration]
)
stability = Perk.create(
  name: "Stability",
  description: "Alteration spells have greater duration",
  skill: alteration,
  skill_points: 70,
  prerequisites: [adept_alteration]
)
expert_alteration = Perk.create(
  name: "Expert Alteration",
  description: "Cast Expert level Alteration spells for half magicka",
  skill: alteration,
  skill_points: 75,
  prerequisites: [adept_alteration]
)
atronach = Perk.create(
  name: "Atronach",
  description: "Absorb 30% of the magicka of any spells that hit you",
  skill: alteration,
  skill_points: 100,
  prerequisites: [expert_alteration]
)
master_alteration = Perk.create(
  name: "Master Alteration",
  description: "Cast Master level Alteration spells for half magicka",
  skill: alteration,
  skill_points: 100,
  prerequisites: [expert_alteration]
)
novice_conjuration = Perk.create(
  name: "Novice Conjuration",
  description: "Cast Novice level Conjuration spells for half magicka",
  skill: conjuration
)
conjuration_dual_casting = Perk.create(
  name: "Conjuration Dual Casting",
  description: "Dual casting a Conjuration spell overcharges the effects into an even more powerful version",
  skill: conjuration,
  skill_points: 20,
  prerequisites: [novice_conjuration]
)
mystic_binding = Perk.create(
  name: "Mystic Binding",
  description: "Bound weapons do more damage",
  skill: conjuration,
  skill_points: 20,
  prerequisites: [novice_conjuration]
)
apprentice_conjuration = Perk.create(
  name: "Apprentice Conjuration",
  description: "Cast Apprentice level Conjuration spells for half magicka",
  skill: conjuration,
  skill_points: 25,
  prerequisites: [novice_conjuration]
)
summoner = Perk.create(
  name: "Summoner",
  description: "Can summon atronachs or raise undead 2x as far away (3x for second rank)",
  skill: conjuration,
  skill_points: 30,
  ranks: 2,
  prerequisites: [novice_conjuration]
)
soul_stealer = Perk.create(
  name: "Soul Stealer",
  description: "Bound weapons cast Soul Trap on targets",
  skill: conjuration,
  skill_points: 30,
  prerequisites: [mystic_binding]
)
necromancy = Perk.create(
  name: "Necromancy",
  description: "Greater duration for reanimated undead",
  skill: conjuration,
  skill_points: 40,
  prerequisites: [novice_conjuration]
)
atromancy = Perk.create(
  name: "Atromancy",
  description: "Double duration for conjured atronachs",
  skill: conjuration,
  skill_points: 40,
  prerequisites: [summoner]
)
oblivion_binding = Perk.create(
  name: "Oblivion Binding",
  description: "Bound weapons will banish summoned creatures and turn raised ones",
  skill: conjuration,
  skill_points: 50,
  prerequisites: [soul_stealer]
)
adept_conjuration = Perk.create(
  name: "Adept Conjuration",
  description: "Cast Adept level Conjuration spells for half magicka",
  skill: conjuration,
  skill_points: 50,
  prerequisites: [apprentice_conjuration]
)
dark_souls = Perk.create(
  name: "Dark Souls",
  description: "Reanimated undead have 100 points more health",
  skill: conjuration,
  skill_points: 70,
  prerequisites: [necromancy]
)
expert_conjuration = Perk.create(
  name: "Expert Conjuration",
  description: "Cast Expert level Conjuration spells for half magicka",
  skill: conjuration,
  skill_points: 75,
  prerequisites: [adept_conjuration]
)
elemental_potency = Perk.create(
  name: "Elemental Potency",
  description: "Conjured atronachs are 50% more powerful",
  skill: conjuration,
  skill_points: 80,
  prerequisites: [atromancy]
)
twin_souls = Perk.create(
  name: "Twin Souls",
  description: "You can have two atronachs or reanimated zombies",
  skill: conjuration,
  skill_points: 100,
  prerequisites: [elemental_potency, dark_souls]
)
master_conjuration = Perk.create(
  name: "Master Conjuration",
  description: "Cast Master level Conjuration spells for half magicka",
  skill: conjuration,
  skill_points: 100,
  prerequisites: [expert_conjuration]
)
novice_destruction = Perk.create(
  name: "Novice Destruction",
  description: "Cast Novice level Destruction spells for half magicka",
  skill: destruction
)
destruction_dual_casting = Perk.create(
  name: "Destruction Dual Casting",
  description: "Dual casting a Destruction spell overcharges the effects into an even more powerful version",
  skill: destruction,
  skill_points: 20,
  prerequisites: [novice_destruction]
)
apprentice_destruction = Perk.create(
  name: "Apprentice Destruction",
  description: "Cast Apprentice level Destruction spells for half magicka",
  skill: destruction,
  skill_points: 25,
  prerequisites: [novice_destruction]
)
augmented_flames = Perk.create(
  name: "Augmented Flames",
  description: "Fire spells do 25% more damage (50% for second rank)",
  skill: destruction,
  skill_points: 30,
  ranks: 2,
  prerequisites: [novice_destruction]
)
augmented_frost = Perk.create(
  name: "Augmented Frost",
  description: "Frost spells do 25% more damage (50% for second rank)",
  skill: destruction,
  skill_points: 30,
  ranks: 2,
  prerequisites: [novice_destruction]
)
augmented_shock = Perk.create(
  name: "Augmented Shock",
  description: "Shock spells do 25% more damage (50% for second rank)",
  skill: destruction,
  skill_points: 30,
  ranks: 2,
  prerequisites: [novice_destruction]
)
impact = Perk.create(
  name: "Impact",
  description: "Most destruction spells will stagger an opponent when dual cast",
  skill: destruction,
  skill_points: 40,
  prerequisites: [destruction_dual_casting]
)
rune_master = Perk.create(
  name: "Rune Master",
  description: "Can place runes five times farther away",
  skill: destruction,
  skill_points: 40,
  prerequisites: [apprentice_destruction]
)
adept_destruction = Perk.create(
  name: "Adept Destruction",
  description: "Cast Adept level Destruction spells for half magicka",
  skill: destruction,
  skill_points: 50,
  prerequisites: [apprentice_destruction]
)
intense_flames = Perk.create(
  name: "Intense Flames",
  description: "Fire damage causes targets to flee if their health is low",
  skill: destruction,
  skill_points: 50,
  prerequisites: [augmented_flames]
)
deep_freeze = Perk.create(
  name: "Deep Freeze",
  description: "Frost damage paralyzes targets if their health is low",
  skill: destruction,
  skill_points: 60,
  prerequisites: [augmented_frost]
)
disintegrate = Perk.create(
  name: "Disintegrate",
  description: "Shock damage disintegrates targets if their health is low",
  skill: destruction,
  skill_points: 70,
  prerequisites: [augmented_shock]
)
expert_destruction = Perk.create(
  name: "Expert Destruction",
  description: "Cast Expert level Destruction spells for half magicka",
  skill: destruction,
  skill_points: 75,
  prerequisites: [adept_destruction]
)
master_destruction = Perk.create(
  name: "Master Destruction",
  description: "Cast Master level Destruction spells for half magicka",
  skill: destruction,
  skill_points: 100,
  prerequisites: [expert_destruction]
)
novice_illusion = Perk.create(
  name: "Novice Illusion",
  description: "Cast Novice level Illusion spells for half magicka",
  skill: illusion
)
illusion_dual_casting = Perk.create(
  name: "Illusion Dual Casting",
  description: "Dual casting an Illusion spell overcharges the effects into an even more powerful version",
  skill: illusion,
  skill_points: 20,
  prerequisites: [novice_illusion]
)
animage = Perk.create(
  name: "Animage",
  description: "Illusion spells now work on higher level animals",
  skill: illusion,
  skill_points: 20,
  prerequisites: [novice_illusion]
)
apprentice_illusion = Perk.create(
  name: "Apprentice Illusion",
  description: "Cast Apprentice level Illusion spells for half magicka",
  skill: illusion,
  skill_points: 25,
  prerequisites: [novice_illusion]
)
hypnotic_gaze = Perk.create(
  name: "Hypnotic Gaze",
  description: "Calm spells now work on higher level opponents",
  skill: illusion,
  skill_points: 30,
  prerequisites: [novice_illusion]
)
kindred_mage = Perk.create(
  name: "Kindred Mage",
  description: "All Illusion spells work on higher level people",
  skill: illusion,
  skill_points: 40,
  prerequisites: [animage]
)
adept_illusion = Perk.create(
  name: "Adept Illusion",
  description: "Cast Adept level Illusion spells for half magicka",
  skill: illusion,
  skill_points: 50,
  prerequisites: [apprentice_illusion]
)
aspect_of_terror = Perk.create(
  name: "Aspect of Terror",
  description: "Fear spells work on higher level opponents",
  skill: illusion,
  skill_points: 50,
  prerequisites: [hypnotic_gaze]
)
quiet_casting = Perk.create(
  name: "Quiet Casting",
  description: "All spells you cast from any school of magic are silent to others",
  skill: illusion,
  skill_points: 50,
  prerequisites: [kindred_mage]
)
rage = Perk.create(
  name: "Rage",
  description: "Frenzy spells work on higher level opponents",
  skill: illusion,
  skill_points: 70,
  prerequisites: [aspect_of_terror]
)
expert_illusion = Perk.create(
  name: "Expert Illusion",
  description: "Cast Expert level Illusion spells for half magicka",
  skill: illusion,
  skill_points: 75,
  prerequisites: [adept_illusion]
)
master_of_the_mind = Perk.create(
  name: "Master of the Mind",
  description: "Illusion spells work on undead, daedra and automatons",
  skill: illusion,
  skill_points: 90,
  prerequisites: [rage, quiet_casting]
)
master_illusion = Perk.create(
  name: "Master Illusion",
  description: "Cast Master level Illusion spells for half magicka",
  skill: illusion,
  skill_points: 100,
  prerequisites: [expert_illusion]
)
novice_restoration = Perk.create(
  name: "Novice Restoration",
  description: "Cast Novice level Restoration spells for half magicka",
  skill: restoration
)
restoration_dual_casting = Perk.create(
  name: "Restoration Dual Casting",
  description: "Dual casting a Restoration spell overcharges the effects into an even more powerful version",
  skill: restoration,
  skill_points: 20,
  prerequisites: [novice_restoration]
)
regeneration = Perk.create(
  name: "Regeneration",
  description: "Healing spells cure 50% more",
  skill: restoration,
  skill_points: 20,
  prerequisites: [novice_restoration]
)
apprentice_restoration = Perk.create(
  name: "Apprentice Restoration",
  description: "Cast Apprentice level Restoration spells for half magicka",
  skill: restoration,
  skill_points: 25,
  prerequisites: [novice_restoration]
)
recovery = Perk.create(
  name: "Recovery",
  description: "Magicka regenerates 25% faster (50% for second rank)",
  skill: restoration,
  skill_points: 30,
  ranks: 2,
  prerequisites: [novice_restoration]
)
respite = Perk.create(
  name: "Respite",
  description: "Healing spells also restore stamina",
  skill: restoration,
  skill_points: 40,
  prerequisites: [novice_restoration]
)
adept_restoration = Perk.create(
  name: "Adept Restoration",
  description: "Cast Adept level Restoration spells for half magicka",
  skill: restoration,
  skill_points: 50,
  prerequisites: [apprentice_restoration]
)
ward_absorb = Perk.create(
  name: "Ward Absorb",
  description: "Ward recharge your magicka when hit with spells",
  skill: restoration,
  skill_points: 60,
  prerequisites: [novice_restoration]
)
necromage = Perk.create(
  name: "Necromage",
  description: "All spells are more effective against undead",
  skill: restoration,
  skill_points: 70,
  prerequisites: [regeneration]
)
expert_restoration = Perk.create(
  name: "Expert Restoration",
  description: "Cast Expert level Restoration spells for half magicka",
  skill: restoration,
  skill_points: 75,
  prerequisites: [adept_restoration]
)
avoid_death = Perk.create(
  name: "Avoid Death",
  description: "Once a day, heals 250 points automatically if you fall below 10% health",
  skill: restoration,
  skill_points: 90,
  prerequisites: [respite]
)
master_restoration = Perk.create(
  name: "Master Restoration",
  description: "Cast Master level Restoration spells for half magicka",
  skill: restoration,
  skill_points: 100,
  prerequisites: [expert_restoration]
)
enchanter = Perk.create(
  name: "Enchanter",
  description: "New enchantments are 20% stronger (+20% per additional rank)",
  skill: enchanting,
  ranks: 5
)
soul_squeezer = Perk.create(
  name: "Soul Squeezer",
  description: "Soul gems provide extra magicka for recharging",
  skill: enchanting,
  skill_points: 20,
  prerequisites: [enchanter]
)
fire_enchanter = Perk.create(
  name: "Fire Enchanter",
  description: "Fire enchantments on weapons and armor are 25% stronger",
  skill: enchanting,
  skill_points: 30,
  prerequisites: [enchanter]
)
soul_siphon = Perk.create(
  name: "Soul Siphon",
  description: "Death blows to creatures, but not people, trap 5% of the victim's soul, recharging the weapon",
  skill: enchanting,
  skill_points: 40,
  prerequisites: [soul_squeezer]
)
frost_enchanter = Perk.create(
  name: "Frost Enchanter",
  description: "Frost enchantments on weapons and armor are 25% stronger",
  skill: enchanting,
  skill_points: 40,
  prerequisites: [fire_enchanter]
)
insightful_enchanter = Perk.create(
  name: "Insightful Enchanter",
  description: "Skill enchantments on armor are 25% stronger",
  skill: enchanting,
  skill_points: 50,
  prerequisites: [enchanter]
)
storm_enchanter = Perk.create(
  name: "Storm Enchanter",
  description: "Shock enchantments on weapons and armor are 25% stronger",
  skill: enchanting,
  skill_points: 50,
  prerequisites: [frost_enchanter]
)
corpus_enchanter = Perk.create(
  name: "Corpus Enchanter",
  description: "Health, magicka and stamina enchantments on armor are 25% stronger",
  skill: enchanting,
  skill_points: 70,
  prerequisites: [insightful_enchanter]
)
extra_effect = Perk.create(
  name: "Extra Effect",
  description: "Can put two enchantments on the same item",
  skill: enchanting,
  skill_points: 100,
  prerequisites: [storm_enchanter, corpus_enchanter]
)
alchemist = Perk.create(
  name: "Alchemist",
  description: "Potions and poisons are 20% stronger (+20% per additional rank)",
  skill: alchemy,
  ranks: 5
)
physician = Perk.create(
  name: "Physician",
  description: "Potions you mix that restore health, magicka or stamina are 25% more powerful",
  skill: alchemy,
  skill_points: 20,
  prerequisites: [alchemist]
)
poisoner = Perk.create(
  name: "Poisoner",
  description: "Poisons you mix are 25% more effective",
  skill: alchemy,
  skill_points: 30,
  prerequisites: [physician]
)
benefactor = Perk.create(
  name: "Benefactor",
  description: "Potions you mix with beneficial effects have an additional 25% greater magnitude",
  skill: alchemy,
  skill_points: 30,
  prerequisites: [physician]
)
experimenter = Perk.create(
  name: "Experimenter",
  description: "Eating an ingredient reveals first two effects (+1 effect per additional rank)",
  skill: alchemy,
  skill_points: 50,
  ranks: 3,
  prerequisites: [benefactor]
)
concentrated_poison = Perk.create(
  name: "Concentrated Poison",
  description: "Poisons applied to weapons last for twice as many hits",
  skill: alchemy,
  skill_points: 60,
  prerequisites: [poisoner]
)
green_thumb = Perk.create(
  name: "Green Thumb",
  description: "Two ingredients are gathered from plants",
  skill: alchemy,
  skill_points: 70,
  prerequisites: [concentrated_poison]
)
snakeblood = Perk.create(
  name: "Snakeblood",
  description: "50% resistance to all poisons",
  skill: alchemy,
  skill_points: 80,
  prerequisites: [concentrated_poison, experimenter]
)
purity = Perk.create(
  name: "Purity",
  description: "All negative effects are removed from created potions, and all positive effects are removed from created poisons",
  skill: alchemy,
  skill_points: 100,
  prerequisites: [snakeblood]
)
agile_defender = Perk.create(
  name: "Agile Defender",
  description: "Increase armor rating for Light Armor by 20% (+20% per additional rank)",
  skill: light_armor,
  ranks: 5
)
custom_fit = Perk.create(
  name: "Custom Fit",
  description: "25% armor bonus if wearing all Light Armor: head, chest, hands, feet",
  skill: light_armor,
  skill_points: 30,
  prerequisites: [agile_defender]
)
unhindered = Perk.create(
  name: "Unhindered",
  description: "Light Armor weighs nothing and doesn't slow you down when worn",
  skill: light_armor,
  skill_points: 50,
  prerequisites: [custom_fit]
)
wind_walker = Perk.create(
  name: "Wind Walker",
  description: "Stamina regenerates 50% faster in all Light Armor: head, chest, hands, feet",
  skill: light_armor,
  skill_points: 60,
  prerequisites: [unhindered]
)
matching_set = Perk.create(
  name: "Matching Set",
  description: "Additional 25% Armor bonus if wearing a matched set of Light Armor",
  skill: light_armor,
  skill_points: 70,
  prerequisites: [custom_fit]
)
deft_movement = Perk.create(
  name: "Deft Movement",
  description: "10% of avoiding all damage from a melee attack while wearing all Light Armor: head, chest, hands, feet",
  skill: light_armor,
  skill_points: 100,
  prerequisites: [wind_walker, matching_set]
)
novice_locks = Perk.create(
  name: "Novice Locks",
  description: "Novice locks are much easier to pick",
  skill: lockpicking
)
apprentice_locks = Perk.create(
  name: "Apprentice Locks",
  description: "Apprentice locks are much easier to pick",
  skill: lockpicking,
  skill_points: 25,
  prerequisites: [novice_locks]
)
quick_hands = Perk.create(
  name: "Quick Hands",
  description: "Able to pick locks without being noticed",
  skill: lockpicking,
  skill_points: 40,
  prerequisites: [apprentice_locks]
)
wax_key = Perk.create(
  name: "Wax Key",
  description: "Automatically gives you a copy of a picked lock's key if it has one",
  skill: lockpicking,
  skill_points: 50,
  prerequisites: [quick_hands]
)
adept_locks = Perk.create(
  name: "Adept Locks",
  description: "Adept locks are much easier to pick",
  skill: lockpicking,
  skill_points: 50,
  prerequisites: [apprentice_locks]
)
golden_touch = Perk.create(
  name: "Golden Touch",
  description: "Find more gold in chests",
  skill: lockpicking,
  skill_points: 60,
  prerequisites: [adept_locks]
)
treasure_hunter = Perk.create(
  name: "Treasure Hunter",
  description: "50% greater chance of finding special treasure",
  skill: lockpicking,
  skill_points: 70,
  prerequisites: [golden_touch]
)
expert_locks = Perk.create(
  name: "Expert Locks",
  description: "Expert locks are much easier to pick",
  skill: lockpicking,
  skill_points: 75,
  prerequisites: [adept_locks]
)
locksmith = Perk.create(
  name: "Locksmith",
  description: "Pick starts close to the lock opening position",
  skill: lockpicking,
  skill_points: 80,
  prerequisites: [expert_locks]
)
unbreakable = Perk.create(
  name: "Unbreakable",
  description: "Lockpicks never break",
  skill: lockpicking,
  skill_points: 100,
  prerequisites: [locksmith]
)
master_locks = Perk.create(
  name: "Master Locks",
  description: "Master locks are much easier to pick",
  skill: lockpicking,
  skill_points: 100,
  prerequisites: [expert_locks]
)
light_fingers = Perk.create(
  name: "Light Fingers",
  description: "Pickpocketing bonus of 20%. Item weight and value reduce pickpocketing odds (+5% per additional rank)",
  skill: pickpocket,
  ranks: 5
)
night_thief = Perk.create(
  name: "Night Thief",
  description: "+25% chance to pickpocket if the target is asleep",
  skill: pickpocket,
  skill_points: 30,
  prerequisites: [light_fingers]
)
poisoned = Perk.create(
  name: "Poisoned",
  description: "Silently harm enemies by placing poisons in their pockets",
  skill: pickpocket,
  skill_points: 40,
  prerequisites: [light_fingers]
)
cutpurse = Perk.create(
  name: "Cutpurse",
  description: "Pickpocketing gold is 50% easier",
  skill: pickpocket,
  skill_points: 40,
  prerequisites: [light_fingers]
)
extra_pockets = Perk.create(
  name: "Extra pockets",
  description: "Carrying capacity is increased by 100",
  skill: pickpocket,
  skill_points: 50,
  prerequisites: [light_fingers]
)
keymaster = Perk.create(
  name: "Keymaster",
  description: "Pickpocketing keys almost always works",
  skill: pickpocket,
  skill_points: 60,
  prerequisites: [cutpurse]
)
misdirection = Perk.create(
  name: "Misdirection",
  description: "Can pickpocket equipped weapons",
  skill: pickpocket,
  skill_points: 70,
  prerequisites: [cutpurse]
)
perfect_touch = Perk.create(
  name: "Perfect Touch",
  description: "Can pickpocket equipped items",
  skill: pickpocket,
  skill_points: 100,
  prerequisites: [misdirection]
)
stealth = Perk.create(
  name: "Stealth",
  description: "You are 20% harder to detect when sneaking (+5% per additional rank)",
  skill: sneak,
  ranks: 5
)
muffled_movement = Perk.create(
  name: "Muffled Movement",
  description: "Noise from armor is reduced by 50%",
  skill: sneak,
  skill_points: 30,
  prerequisites: [stealth]
)
backstab = Perk.create(
  name: "Backstab",
  description: "Sneak attacks with one-handed weapons now do six times damage",
  skill: sneak,
  skill_points: 30,
  prerequisites: [stealth]
)
light_foot = Perk.create(
  name: "Light Foot",
  description: "You won't trigger pressure plates",
  skill: sneak,
  skill_points: 40,
  prerequisites: [muffled_movement]
)
deadly_aim = Perk.create(
  name: "Deadly Aim",
  description: "Sneak attacks with bows now do three times damage",
  skill: sneak,
  skill_points: 40,
  prerequisites: [backstab]
)
silent_roll = Perk.create(
  name: "Silent Roll",
  description: "Sprinting while sneaking executes a silent forward roll",
  skill: sneak,
  skill_points: 50,
  prerequisites: [light_foot]
)
assassins_blade = Perk.create(
  name: "Assassin's Blade",
  description: "Sneak attacks with daggers now do a total of fifteen times normal damage",
  skill: sneak,
  skill_points: 50,
  prerequisites: [deadly_aim]
)
silence = Perk.create(
  name: "Silence",
  description: "Walking and running does not affect detection",
  skill: sneak,
  skill_points: 70,
  prerequisites: [silent_roll]
)
shadow_warrior = Perk.create(
  name: "Shadow Warrior",
  description: "Crouching stops combat for a moment and forces distant opponents to search for a target",
  skill: sneak,
  skill_points: 100,
  prerequisites: [silence]
)
haggling = Perk.create(
  name: "Haggling",
  description: "Buying and selling prices are 10% better (+5% per additional rank)",
  skill: speech,
  ranks: 5
)
allure = Perk.create(
  name: "Allure",
  description: "10% better prices with the opposite sex",
  skill: speech,
  skill_points: 30,
  prerequisites: [haggling]
)
bribery = Perk.create(
  name: "Bribery",
  description: "Can bribe guards to ignore crimes",
  skill: speech,
  skill_points: 30,
  prerequisites: [haggling]
)
merchant = Perk.create(
  name: "Merchant",
  description: "Can sell any type of item to any kind of merchant",
  skill: speech,
  skill_points: 50,
  prerequisites: [allure]
)
persuasion = Perk.create(
  name: "Persuasion",
  description: "Persuasion attempts are 30% easier",
  skill: speech,
  skill_points: 50,
  prerequisites: [bribery]
)
investor = Perk.create(
  name: "Investor",
  description: "Can invest 500 gold with a shopkeeper to increase his available gold permanently",
  skill: speech,
  skill_points: 70,
  prerequisites: [merchant]
)
intimidation = Perk.create(
  name: "Intimidation",
  description: "Intimidation is twice as successful",
  skill: speech,
  skill_points: 70,
  prerequisites: [persuasion]
)
fence = Perk.create(
  name: "Fence",
  description: "Can barter stolen goods with any merchant you have invested in",
  skill: speech,
  skill_points: 90,
  prerequisites: [investor]
)
master_trader = Perk.create(
  name: "Master Trader",
  description: "Every merchant in the world gains 1000 gold for bartering",
  skill: speech,
  skill_points: 100,
  prerequisites: [fence]
)
