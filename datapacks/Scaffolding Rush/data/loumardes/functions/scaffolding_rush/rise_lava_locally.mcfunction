#Get LavaLevel
tp @e[type=area_effect_cloud,tag=ScR_LavaLevel,limit=1] @s
execute store result entity @e[type=area_effect_cloud,tag=ScR_LavaLevel,limit=1] Pos[1] double 1 run scoreboard players get LavaLevel constant

#Raise Lava
execute unless score LavaLevel constant matches 1 as @e[type=area_effect_cloud,tag=ScR_LavaLevel,limit=1] at @s run fill ~-7 ~-1 ~-7 ~7 ~-1 ~7 magma_block
execute unless score LavaLevel constant matches ..2 as @e[type=area_effect_cloud,tag=ScR_LavaLevel,limit=1] at @s run fill ~-8 ~-1 ~-8 ~8 ~-1 ~8 magma_block replace air
