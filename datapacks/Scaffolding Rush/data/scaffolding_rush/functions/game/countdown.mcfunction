gamemode adventure @a[team=!]

clear @a
scoreboard players set GameLobby global 0
scoreboard players set GameLoading global 1

scoreboard players add GameId global 1
scoreboard players operation @a gameId = GameId global

scoreboard players reset @a StartGame

setblock 0 5 7 cave_air

execute if score RandomTeam options matches 1 run function scaffolding_rush:team/join/random

function scaffolding_rush:broadcast/10s

schedule function scaffolding_rush:clear/launch 2s

kill @e[tag=lobbyText]
kill @e[type=falling_block]
kill @e[type=arrow]
kill @e[type=item]
gamemode spectator @a[team=]

schedule function scaffolding_rush:team/create_base/create 4s

schedule function scaffolding_rush:broadcast/5s 5s
schedule function scaffolding_rush:broadcast/4s 6s
schedule function scaffolding_rush:broadcast/3s 7s
schedule function scaffolding_rush:broadcast/2s 8s
schedule function scaffolding_rush:broadcast/1s 9s
schedule function scaffolding_rush:game/start 10s

#disable trigers
function scaffolding_rush:options/disable_all

#get lavaspeed timer in tics
scoreboard players operation LavaSpeedTics options = LavaSpeed options
scoreboard players operation LavaSpeedTics options *= #20 global

#get villager respawn timer in tics
scoreboard players operation VillagerRespawnTics global = VillagerRespawn options
scoreboard players operation VillagerRespawnTics global *= #20 global

#reset villagers respawn countdowns
scoreboard players set RedVillagerRespawn global -1
scoreboard players set BlueVillagerRespawn global -1
scoreboard players set YellowVillagerRespawn global -1
scoreboard players set GreenVillagerRespawn global -1

#Bossbar
bossbar set minecraft:filling_lava players @a
bossbar set minecraft:filling_lava visible true
execute store result bossbar filling_lava max run scoreboard players get LavaSpeedTics options
