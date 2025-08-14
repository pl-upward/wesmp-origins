execute as @e[tag=geto.testing] run say summon_mob Function Reached


# Reapplies this tag just to be safe
execute in minecraft:overworld in minecraft:overworld positioned 2420008 100 2420008 run tag @e[distance=..3] add geto.captured

# Gets max id
execute in minecraft:overworld positioned 2420008 100 2420008 store result score max.id geto.id run execute if entity @e[distance=..3]
scoreboard players remove max.id geto.id 1

# Tags the selected entity
execute unless score max.id geto.id matches -1 as @e[tag=geto.captured] if score @s geto.id = @p geto.id run tag @s add geto.retrieve
tag @e[tag=geto.retrieve] remove geto.captured
team join geto.controlled @e[tag=geto.retrieve]
tp @e[tag=geto.retrieve,type=!squid,type=!glow_squid] ~ ~ ~


# Does the funny thing wth the squid
execute anchored eyes positioned ~ ~ ~ run tp @e[tag=geto.retrieve,type=squid] ^ ^ ^1 facing ^ ^ ^5
execute anchored eyes positioned ~ ~ ~ run tp @e[tag=geto.retrieve,type=glow_squid] ^ ^ ^1 facing ^ ^ ^5
power grant @e[tag=geto.retrieve,type=glow_squid,limit=1,sort=nearest] redwood:geto/external/squid
power grant @e[tag=geto.retrieve,type=squid,limit=1,sort=nearest] redwood:geto/external/squid

# Continuation of before squid interupt
data merge entity @e[tag=geto.retrieve,limit=1] {NoAI:0b, Invulnerable:0b, NoGravity:0b}
scoreboard players reset @e[tag=geto.retrieve] geto.id
execute as @e[tag=geto.retrieve] run title @p[team=geto.controlled] actionbar ["Summoned ",{"selector":"@s"}]
tag @e[tag=geto.retrieve] remove geto.retrieve


# Reshuffles list to make sure nothing's broken
execute in minecraft:overworld positioned 2420008 100 2420008 store result score max.id geto.id run execute if entity @e[distance=..3]
scoreboard players remove max.id geto.id 1
scoreboard players set list.check geto.id 0
function redwood:geto/reshuffle_id

# Loops selected id
execute if score @s geto.id > max.id geto.id run scoreboard players set @s geto.id 0