enable_perk = ($perk) ->
  enabled = ($perk.data("points_met") isnt false and
    $perk.data("perks_met") isnt false)
  $perk.find("input[type=checkbox], select").prop("disabled", !enabled)

# Determines whether a perk is chosen based on whether the checkbox is checked
# or the selection dropdown is greater than zero
is_chosen = ($perk) ->
  $checkbox = $perk.find("input[type=checkbox]")
  if $checkbox.size() > 0
    $checkbox.prop("checked")
  else
    $perk.find("select").val() > 0

monitor_requisite = ($requisite, $perk) ->
  if is_chosen($requisite)
    $perk.data("perks_met", true)
  else
    $perk.data("perks_met", false)
  enable_perk $perk

monitor_perks = ($perk) ->
  requisite_ids = $perk.data("perks")

  # Turn into an array
  if (typeof requisite_ids).toLowerCase() == "number"
    requisite_ids = [requisite_ids]
  else
    requisite_ids = requisite_ids.split(", ")

  console.log requisite_ids.length
    
  for requisite_id in requisite_ids
    $requisite = $("#perk#{requisite_id}")
    check = -> monitor_requisite($requisite, $perk)
    $requisite.find("input[type=checkbox], select").mouseup(check).keyup(check).change(check)

monitor_points = ($perk, $points) ->
  # Get required points
  required_points = $perk.data("points")

  # Build formula for whether the point requirement is met
  check = ->
    if $points.val() >= required_points
      $perk.data("points_met", true)
    else
      $perk.data("points_met", false)
    enable_perk $perk

  # Assign check to all potentially relevant events
  $points.mouseup(check).keyup(check).change(check)

$ ->
  # Go through each skill row in the table
  $(".skill").each (i, skill) ->
    $skill = $(skill)
    $points = $skill.find("input[type=number]")
    $skill.find(".perks li[data-perks]").each (j, perk) ->
      monitor_perks $(perk)
    $skill.find(".perks li[data-points]").each (j, perk) ->
      monitor_points $(perk), $points
