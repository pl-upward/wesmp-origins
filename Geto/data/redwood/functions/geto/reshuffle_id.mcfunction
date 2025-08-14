execute as @e[tag=geto.testing] run say reshuffle_id Function Reached


scoreboard players set CommandSuccess geto.id 0

# Checks if there are any entities with the list.check id
execute in minecraft:overworld positioned 2420008 100 2420008 as @e[distance=..3] if score @s geto.id = list.check geto.id run scoreboard players add CommandSuccess geto.id 1

# If there is a double up, deals with it
execute in minecraft:overworld positioned 2420008 100 2420008 if score CommandSuccess geto.id matches 2..1000 run function redwood:geto/clear_double_up

# If there is one, moves onto next score to check
execute if score CommandSuccess geto.id matches 1 run scoreboard players add list.check geto.id 1

# If there isn' one, shifts all scores of entities above it down 1
execute in minecraft:overworld positioned 2420008 100 2420008 if score CommandSuccess geto.id matches 0 as @e[distance=..3] if score @s geto.id > list.check geto.id run scoreboard players remove @s geto.id 1

execute if score max.id geto.id >= list.check geto.id run function redwood:geto/reshuffle_id

# Reapplies this tag just to be safe
execute in minecraft:overworld positioned 2420008 100 2420008 run tag @e[distance=..3] add geto.captured
team join geto.controlled @e[tag=geto.captured]
