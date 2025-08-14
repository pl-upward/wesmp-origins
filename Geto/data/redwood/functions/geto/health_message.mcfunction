execute as @e[tag=geto.testing] run say health_message Function Reached


execute store result score temp.health geto.id run data get entity @s Health
scoreboard players operation temp.health geto.id /= constant.2 geto.id


title @p[team=geto.controlled] actionbar ["",{"text":"This entity isn't weak enough (","color":"red"},{"score":{"name":"temp.health","objective":"geto.id"},"color":"red"},{"text":"♥)","color":"red"}]