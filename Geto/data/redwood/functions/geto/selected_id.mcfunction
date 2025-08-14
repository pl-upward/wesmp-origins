execute as @e[tag=geto.testing] run say selected_id Function Reached


# Gets max id
execute in minecraft:overworld positioned 2420008 100 2420008 store result score max.id geto.id run execute if entity @e[distance=..3]
scoreboard players remove max.id geto.id 1

# Reshuffles list to make sure nothing's broken
scoreboard players set list.check geto.id 0
function redwood:geto/reshuffle_id

# Adds 1 to selected score
scoreboard players add @s geto.id 1
execute if score @s geto.id > max.id geto.id run scoreboard players set @s geto.id 0

# Prints "No Captured Mobs" if the max id is -1
execute if score max.id geto.id matches -1 run title @p actionbar "No Captured Mobs"

# If there are mobs, prints the name of the selected mob
execute in minecraft:overworld positioned 2420008 100 2420008 run tag @e[distance=..3] add geto.captured
team join geto.controlled @e[tag=geto.captured]
execute unless score max.id geto.id matches -1 as @e[tag=geto.captured] if score @s geto.id = @p geto.id run title @p actionbar ["Selected ",{"selector":"@s"}]