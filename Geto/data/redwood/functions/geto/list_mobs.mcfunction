execute in minecraft:overworld positioned 2420008 100 2420008 as @e[distance=..10] run tellraw @a[team=geto.controlled] ["",{"text":"• ","bold":true},{"selector":"@s"}]

# Resets their ability to trigger
scoreboard players enable @s list_mobs