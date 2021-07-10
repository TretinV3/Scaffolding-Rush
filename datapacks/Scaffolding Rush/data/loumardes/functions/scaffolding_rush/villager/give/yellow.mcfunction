tag @a[team=yellow] remove has_egg
clear @a[team=yellow] ghast_spawn_egg
clear @a[team=yellow] blaze_spawn_egg
execute as @e[type=villager,team=yellow] run function loumardes:scaffolding_rush/clean_kill
execute as @s[nbt=!{SelectedItem:{id:"minecraft:scaffolding"}},nbt=!{SelectedItem:{id:"minecraft:yellow_concrete_powder"}}] run replaceitem entity @s weapon.mainhand blaze_spawn_egg{HideFlags:24,CanPlaceOn:["minecraft:scaffolding","#loumardes:lobby","#loumardes:tower"],CanDestroy:["minecraft:scaffolding","#loumardes:lobby","#loumardes:tower"],display:{Name:'{"text":"Villager spawner","italic":false}'},EntityTag:{id:"minecraft:villager",Attributes:[{Base:0d,Name:"minecraft:generic.movement_speed"},{Name:"minecraft:generic.knockback_resistance",Base:1d}],ActiveEffects:[{Id:24,Amplifier:0,Duration:2147483647,ShowParticles:0b}],Health:3,Team:yellow}}
execute as @s[nbt=!{Inventory:[{id:"minecraft:blaze_spawn_egg"}]}] run give @s blaze_spawn_egg{HideFlags:24,CanPlaceOn:["minecraft:scaffolding","#loumardes:lobby","#loumardes:tower"],CanDestroy:["minecraft:scaffolding","#loumardes:lobby","#loumardes:tower"],display:{Name:'{"text":"Villager spawner","italic":false}'},EntityTag:{id:"minecraft:villager",Attributes:[{Base:0d,Name:"minecraft:generic.movement_speed"},{Name:"minecraft:generic.knockback_resistance",Base:1d}],ActiveEffects:[{Id:24,Amplifier:0,Duration:2147483647,ShowParticles:0b}],Health:3,Team:yellow}}
tag @s add has_egg
