execute as @e[tag=geto.testing] run say clear_double_up Function Reached


# tags all doubled up entities at current testing id
execute as @e[distance=..3] if score @s geto.id = list.check geto.id run tag @s add geto.doubleup


# This function is only called if there is a double up
# Moves one of the doubleups (or n- ups) to the max id
scoreboard players operation @e[limit=1,tag=geto.doubleup,distance=..3] geto.id = max.id geto.id
tag @e[distance=..3] remove geto.doubleup