execute as @e[tag=geto.testing] run say load Function Reached


# Forceloads scoring chunk
execute in minecraft:overworld positioned 2420008 100 2420008 run forceload add ~ ~

# clears out a bit of space
execute in minecraft:overworld positioned 2420008 100 2420008 run fill ~4 ~4 ~4 ~-4 ~-4 ~-4 air 
execute in minecraft:overworld positioned 2420008 100 2420008 run fill ~4 ~4 ~4 ~-4 ~-4 ~-4 obsidian hollow

# Adds the id
scoreboard objectives add geto.id dummy

# adds constants
scoreboard players set constant.2 geto.id 2

# Adds the team
team add geto.controlled

# Adds the trigger command for /trigger list_mobs
scoreboard objectives add list_mobs trigger