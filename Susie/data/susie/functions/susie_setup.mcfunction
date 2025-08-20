scoreboard objectives add susie_heals dummy
execute unless score @s susie_heals matches 1.. run scoreboard players set Prenroke susie_heals 0

scale set pehkui:width 1.1 @s
scale set pehkui:height 1.1 @s
scale set pehkui:reach 1.1 @s
scale set pehkui:knockback 1.1 @s

scale persist set pehkui:width true
scale persist set pehkui:height true
scale persist set pehkui:reach true
scale persist set pehkui:knockback true