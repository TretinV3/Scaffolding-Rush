
execute if score GameRunning global matches 1 run tellraw @a ["",{"text":"[SR] ","color":"gold"},{"text":"The game has been stopped. Reset in progress...","color":"gray"}]
execute if score GameLoading global matches 1 run tellraw @a ["",{"text":"[SR] ","color":"gold"},{"text":"The launching of the game has been stopped. Reset in progress...","color":"gray"}]
execute if score GameLoading global matches 0 if score GameRunning global matches 0 run tellraw @a ["",{"text":"[SR] ","color":"gold"},{"text":"Reset in progress...","color":"gray"}]

function scaffolding_rush:clear/launch
execute as @e[type=villager] run function scaffolding_rush:clean_kill

schedule clear scaffolding_rush:clear/launch
schedule clear scaffolding_rush:team/create_base/create
schedule clear scaffolding_rush:broadcast/5s
schedule clear scaffolding_rush:broadcast/4s
schedule clear scaffolding_rush:broadcast/3s
schedule clear scaffolding_rush:broadcast/2s
schedule clear scaffolding_rush:broadcast/1s
schedule clear scaffolding_rush:game/start
schedule clear scaffolding_rush:lava/sound

scoreboard players set LavaLevel global 2
scoreboard players set GameLobby global 1
scoreboard players set GameEnd global 0
scoreboard players set GameRunning global 0
scoreboard players set GameLoading global 0

team modify blue seeFriendlyInvisibles false
team modify green seeFriendlyInvisibles false
team modify red seeFriendlyInvisibles false
team modify yellow seeFriendlyInvisibles false

scoreboard players add GameId global 1
scoreboard players operation @a gameId = GameId global

function scaffolding_rush:options/activate_all

function scaffolding_rush:options/labels

tag @a remove has_egg
tag @a remove VillagerRecup
tag @a remove Respawning

gamemode survival @a
clear @a
effect clear @a

spawnpoint @s 0 4 0

#advancement replenish
advancement revoke @a from scaffolding_rush:replenish

function scaffolding_rush:lobby/load
execute as @a run function scaffolding_rush:lobby/give_items

scoreboard players set @a StartGame 0
scoreboard players enable @a StartGame
scoreboard players set @a Reset 0
scoreboard players enable @a Reset

tag @a remove TeamEliminated

#Bossbar
bossbar set minecraft:filling_lava visible false

schedule clear scaffolding_rush:game/islandwait