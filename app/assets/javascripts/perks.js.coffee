# Set variables locally accessible within this script
MAJOR_MOD = 10
MINOR_MOD = 5

# For URL compression
NUMBER_PLACES = 7
SELECT_PLACES = 5

BASE_XP = 2815
THOUSANDS_REGEX = ///
                  \B            # not word boundary
                  (?=           # look-ahead
                    (?:\d{3})+  # match of series of three digits in a row
                    (?!\d)      # negative-lookahead for a digit
                  )
                  ///g          # match multiple times per number

$races = null
$url = null
$points = null
$level = null
$experience = null
skills = []
hashes = {}

# Add thousands places
number_with_commas = (x) ->
  x.toString().replace(THOUSANDS_REGEX, ",")

# Gets the type of node or, if it's an input, the type of input node
get_type = ($option) ->
  node_name = $option[0].nodeName.toLowerCase()
  if node_name is "input"
    $option.attr("type").toLowerCase()
  else
    node_name

# Enable or disable perk
enable_perk = ($perk, enabled) ->
  disabled = (enabled is false)
  $option = $perk.find("input, select")
  $option.prop "disabled", disabled

  # If disabled, uncheck or set value to zero
  if enabled isnt true
    switch get_type($option)
      when "checkbox"
        $option.prop "checked", false
        $option.trigger "change"
      when "select"
        if disabled
          $option.val ""
        else
          index = $option[0].selectedIndex
          $option.find("option").each (i, rank) ->
            $(rank).prop "disabled", (i > enabled)
            # To change the selection, the current index must exceed the
            # allowed level, be equal to the index we're testing, and that must
            # be greater than 0
            if i > enabled and i is index and index > 0
              $option[0].selectedIndex--
              $option.trigger "change"

# Determines whether a perk is chosen based on the value of a particular input
is_chosen = ($option) ->
  # Separate based on element type
  switch get_type($option)
    when "checkbox"
      $option.prop "checked"
    when "select"
      $option.val() isnt ""
    else
      false

# Calculate the allowable ranks for a given skill level
allowable_ranks = (points, required, addl) ->
  if addl?
    Math.floor (points - (required || 0)) / addl + 1
  else
    true

# Build monitor for perk
monitor_check = ($points, required_points, additional_rank, $required_perks) ->
  points = $points.val()

  # False if point requirement exists and is not met
  if (required_points?) and (points < required_points)
    return false

  # Return true if no perk requirements to check
  if $required_perks.length is 0
    return allowable_ranks(points, required_points, additional_rank)

  # True if one perk is met 
  for $option in $required_perks
    if is_chosen($option)
      return allowable_ranks(points, required_points, additional_rank)

  # Point requirements met but perk requirements not met
  false

# Conceptually, this is inferior; I should be assigning singular events to each
# and having events "bubble" or "tree" up from there, but this is easier to
# conceptualize. It has performance penalties, but the code should be more
# maintainable. Besides, the target audience has PCs capable of playing Skyrim.
# Shucks.
monitor_requirements = ($perk, $points) ->
  # Initialize container for holding all monitored inputs for enumeration.
  # Container will later be joined into a comma-delimited string.
  full_list = []
  
  # Get the point requirements
  required_points = $perk.data("points")
  additional_rank = $perk.data("addl")
  full_list.push "##{$points.attr("id")}"
  
  # Get the skill requirements
  required_perk_ids = $perk.data("perks") || []
  $required_perks = []

  # Add all required perks to arrays for enumeration for perks specifically and
  # for all inputs (inclusive of skill points)
  for perk_id in required_perk_ids
    option = "#option#{perk_id}"
    $required_perks.push $(option)
    full_list.push option

  # Now that we know all point values and perk requirements to monitor, create
  # a function to evaluate whether all requirements are met
  check = ->
    enable_perk $perk, monitor_check($points, required_points, additional_rank, $required_perks)

  # Create monitor events for each element in the list
  $(full_list.join(", ")).mouseup(check).keyup(check).change(check)

# Check all skills to make sure they're within 15 and 100
check_skills = (skills) ->
  for skill in skills
    $points = $("#points#{skill}")

    # Make sure all skills stay between 15 and 100
    $points.val(15) if parseInt($points.val()) < 15
    $points.val(100) if parseInt($points.val()) > 100

    # Trigger any events associated with the skill
    $points.trigger "change"

# Modify skills by major/minor modification amount
modify_skills = (skills, multiplier, check_limits = false) ->
  # First skill is major
  is_major = true
  for skill in skills
    $points = $("#points#{skill}")

    # Set points equal to current value, plus major/minor mod amount multiplied
    # by the multiplier
    $points.val parseInt($points.val()) +
      multiplier * (if is_major then MAJOR_MOD else MINOR_MOD)

    # Following skills are minor
    is_major = false

# Adjust skill points
adjust_skills = ->
  # Change races, preserving the previous set of skills while we determine what
  # to adjust
  $races.data("skills")
  $selected = $races.find("option:selected")
  previous_skills = skills
  skills = $selected.data("skills")

  # Modify skills
  modify_skills previous_skills, -1
  modify_skills skills, 1, true

  # Check whether skills are within 15 and 100
  check_skills previous_skills
  check_skills skills

# Pads a string with zeroes until it reaches the desired length
left_pad = (str, length) ->
  while str.length < length
    str = "0#{str}"
  str

# Build hashes
get_hashes = ->
  hashes = {}
  segments = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&')
  for segment in segments
    parts = segment.split('=')
    hashes[parts[0]] = parts[1]

# Load character from URL params
load_url = ->
  if hashes.q
    parts = hashes.q.split("|")
    name = parts[0]
    
    # Convert from base 36 to binary
    text_36 = parts[1]
    text = ""
    i = 0
    while i < text_36.length
      converted = parseInt(text_36.substr(i, 3), 36).toString(2)
      text += left_pad(converted, 15)
      i += 3
    index = 1
    value = null

    # Fill in selects and inputs
    $("select, input[id!=url]").each (i, option) ->
      $option = $(option)
      switch get_type($option)
        when "checkbox"
          value = parseInt(text.substr(index, 1), 2)
          $option.prop "checked", (value is 1)
          index++
        when "number"
          value = parseInt(text.substr(index, NUMBER_PLACES), 2)
          multiplier = if $option.hasClass("stat") then 10 else 1
          $option.val value * multiplier
          index += NUMBER_PLACES
        when "select"
          value = parseInt(text.substr(index, SELECT_PLACES), 2)
          $option.val $option.find("option").eq(value).val()
          index += SELECT_PLACES
        when "text"
          $option.val name

      # For some reason, running this right after updating the name isn't
      # working. Should look into it later (the i isnt 0 part)
      $option.trigger("change") if value isnt 0 and i isnt 0

# Constantly build URLs as values change
build_urls = ->
  # Necessary to prevent initial zeroes from being lost
  text = "1"
  name = ""

  # Get binary values from selects and inputs
  $("select, input[id!=url]").each (i, option) ->
    $option = $(option)
    switch get_type($option)
      when "checkbox"
        text += (if $option.prop("checked") then 1 else 0)
      when "number"
        divisor = if $option.hasClass("stat") then 10 else 1
        text += left_pad(parseInt($option.val() / divisor).toString(2), NUMBER_PLACES)
      when "select"
        text += left_pad($option[0].selectedIndex.toString(2), SELECT_PLACES)
      when "text"
        name = $option.val()

  # Convert from binary to base 36
  text_36 = ""
  i = 0
  while i < text.length
    converted = parseInt(text.substr(i, 15), 2).toString(36)
    text_36 += left_pad(converted, 3)
    i += 15

  # Write to URL box
  $url.val window.location.origin + "/?q=#{name}|#{text_36}"

# Calculates experience gained thus far for a skill (inclusive of base XP)
xp_from_skill = (points) ->
  points = parseInt(points)
  points * (points + 1) / 2

# Calculates level from total XP
calculate_level = (exp) ->
  Math.floor((Math.sqrt(8 * exp + 1225) / 5 - 5) / 2)

show_progress = ->
  # Calculate total XP
  exp = 0
  $points.each (i, point) -> exp += xp_from_skill($(point).val())
  exp -= BASE_XP

  # Give XP to experience text, excluding base XP
  $experience.text number_with_commas(exp)

  # Calculate level
  $level.text calculate_level(exp)

$ ->
  # Go through each skill row in the table
  $(".skill").each (i, skill) ->
    $skill = $(skill)
    $points = $skill.find("input[type=number]")
    $skill.find(".perks li").each (j, perk) ->
      monitor_requirements $(perk), $points

  # Set event for adjusting skill points
  $races = $("#races")
  if $races.size() > 0
    $races.change adjust_skills
    $races.val("Nord").trigger("change")

  # Set points to auto-update level
  $points = $(".skill input[type=number]")
  $level = $("#level")
  $experience = $("#experience")
  $points.mouseup(show_progress).keyup(show_progress).change(show_progress)

  # Calculate hashes from URL
  get_hashes()

  $url = $("#url")
  if $url.size() > 0
    $("select, input[id!=url]").keyup(build_urls).mouseup(build_urls).change(build_urls)

    # Highlight URL on click
    $url.click -> $url.focus().select()

    # Load information from current URL if it exists
    load_url()

  show_progress()
