execute as @e[tag=geto.testing] run say summon_all_mobs Function Reached


# Reapplies this tag just to be safe
execute in minecraft:overworld in minecraft:overworld positioned 2420008 100 2420008 run tag @e[distance=..3] add geto.captured

# Tags the selected entity
execute in minecraft:overworld positioned 2420008 100 2420008 run tag @e[distance=..3] add geto.retrieve
tag @e[tag=geto.retrieve] remove geto.captured
team join geto.controlled @e[tag=geto.retrieve]
tp @e[tag=geto.retrieve] ~ ~ ~
execute as @e[tag=geto.retrieve] run data merge entity @s {NoAI:0b, Invulnerable:0b, NoGravity:0b}
scoreboard players reset @e[tag=geto.retrieve] geto.id
execute as @e[tag=geto.retrieve] run title @p[team=geto.controlled] actionbar ["Summoned All Mobs"]
tag @e[tag=geto.retrieve] remove geto.retrieve


# Sets list to 0
scoreboard players set @s geto.id 0
scoreboard players set max.id geto.id 0