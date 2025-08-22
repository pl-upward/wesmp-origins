scoreboard objectives add anchorx dummy "xpos"
scoreboard objectives add anchory dummy "ypos"
scoreboard objectives add anchorz dummy "zpos"

execute as @a store result score @s anchorx run data get entity @s Pos[0]
execute as @a store result score @s anchory run data get entity @s Pos[1]
execute as @a store result score @s anchorz run data get entity @s Pos[2]

