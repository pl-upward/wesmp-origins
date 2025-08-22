data modify storage anchor input set value {"x":0,"y":0,"z":0}
execute store result storage minecraft:anchor input.x double 1 run scoreboard players get @s anchorx
execute store result storage minecraft:anchor input.y double 1 run scoreboard players get @s anchory
execute store result storage minecraft:anchor input.z double 1 run scoreboard players get @s anchorz

#stores player position in global nbt storage.
