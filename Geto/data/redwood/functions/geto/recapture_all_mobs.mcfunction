execute as @e[tag=geto.testing] run say recapture_all_mobs Function Reached



# Stores how many mobs are being recaptured in a scoreboard
execute store result score mobs.recaptured geto.id run execute if entity @e[team=geto.controlled, type=!player, distance=..15]

# Captures mobs
execute as @e[team=geto.controlled, type=!player, distance=..15] at @s run function redwood:geto/capture_mob

# Title :)
execute if score mobs.recaptured geto.id matches 1 run title @s actionbar ["Recaptured ",{"score":{"name":"mobs.recaptured","objective":"geto.id"}}," mob"]
execute unless score mobs.recaptured geto.id matches 1 run title @s actionbar ["Recaptured ",{"score":{"name":"mobs.recaptured","objective":"geto.id"}}," mobs"]


#Makes sure nothing is TOO fucked up
function redwood:geto/reshuffle_id