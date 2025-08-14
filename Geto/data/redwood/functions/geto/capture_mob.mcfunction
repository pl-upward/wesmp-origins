execute as @e[tag=geto.testing] run say capture_mob Function Reached

# Disables the entity
data merge entity @s {NoAI:1b, Invulnerable:1b, NoGravity:1b, ignited:0b, PersistenceRequired:1b}

# Gives actionbar notification to user
title @p[team=geto.controlled] actionbar ["Captured ",{"selector":"@s"}]

# Restores health
data modify entity @s Health set value 10000

# Applies nausea to user
execute unless entity @s[team=geto.controlled] run effect give @p[team=geto.controlled] nausea 8 0
execute unless entity @s[team=geto.controlled] run effect give @p[team=geto.controlled] weakness 8 0

# Joins team
team join geto.controlled @s

# Gives it an id by getting the total number of mobs now captured, note id starts at 0 then goes upwards
scoreboard players set @s geto.id 0
execute in minecraft:overworld positioned 2420008 100 2420008 store result score @s geto.id run execute if entity @e[distance=..3]

# Moves it to collection zone
execute in minecraft:overworld run tp @s 2420008 100 2420008

# Sorts out any problems with ids, after waiting a second so that the mob can actually get there
execute in minecraft:overworld positioned 2420008 100 2420008 store result score max.id geto.id run execute if entity @e[distance=..3]
scoreboard players remove max.id geto.id 1
scoreboard players set list.check geto.id 0
schedule function redwood:geto/reshuffle_id 3t

# Applies the captured tag
execute in minecraft:overworld positioned 2420008 100 2420008 run tag @e[distance=..3] add geto.captured
team join geto.controlled @e[tag=geto.captured]
