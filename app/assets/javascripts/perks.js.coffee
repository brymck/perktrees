# Gets the type of node or, if it's an input, the type of input node
get_type = ($option) ->
  node_name = $option[0].nodeName.toLowerCase()
  if node_name is "input"
    $option.attr("type").toLowerCase()
  else
    node_name

# Enable or disable perk
enable_perk = ($perk, enabled) ->
  $option = $perk.find("input, select")
  $option.prop "disabled", !enabled

  # If disabled, uncheck or set value to zero
  if not enabled
    switch get_type($option)
      when "checkbox"
        $option.prop "checked", false
      when "select"
        $option.val 0
    $option.trigger "change"

# Determines whether a perk is chosen based on the value of a particular input
is_chosen = ($option) ->
  # Separate based on element type
  switch get_type($option)
    when "checkbox"
      $option.prop "checked"
    when "select"
      $option.val() isnt 0
    else
      false

# Build monitor for perk
monitor_check = ($points, required_points, $required_perks) ->
  # False if point requirement exists and is not met
  if (not required_points?) or ($points.val() < required_points)
    return false

  # Return true if no perk requirements to check
  if $required_perks.length == 0
    return true

  # True if one perk is met 
  for $option in $required_perks
    if is_chosen($option)
      return true

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
  full_list.push "##{$points.attr("id")}" if required_points?
  
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
    enable_perk $perk, monitor_check($points, required_points, $required_perks)

  # Create monitor events for each element in the list
  $(full_list.join(", ")).mouseup(check).keyup(check).change(check)

$ ->
  # Go through each skill row in the table
  $(".skill").each (i, skill) ->
    $skill = $(skill)
    $points = $skill.find("input[type=number]")
    $skill.find(".perks li").each (j, perk) ->
      monitor_requirements $(perk), $points
