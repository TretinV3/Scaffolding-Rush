execute as @e[type=villager] run function scaffolding_rush:clean_kill
kill @e[type=!player]
kill @e[type=!player]

fill -90 0 -90 90 0 90 bedrock

#summons the AEC indiquant la position de la lave
execute unless entity @e[type=area_effect_cloud,name="ScR_LavaLevel"] run summon minecraft:area_effect_cloud 0 1 0 {Duration:2147483647, CustomName:'{"text":"ScR_LavaLevel"}'}
execute unless entity @e[type=area_effect_cloud,name="ScR_BuildLimit"] run summon minecraft:area_effect_cloud 0 1 0 {Duration:2147483647, CustomName:'{"text":"ScR_BuildLimit"}'}
execute unless entity @e[type=area_effect_cloud,name="ScR_Build"] run summon minecraft:area_effect_cloud 0 1 0 {Duration:2147483647, CustomName:'{"text":"ScR_Build"}'}

#trigger controls
scoreboard objectives add StartGame trigger
scoreboard objectives add Reset trigger

scoreboard objectives add opt_preset trigger
scoreboard objectives add opt_island trigger
scoreboard objectives add opt_island_spawn trigger
scoreboard objectives add opt_island_first trigger
scoreboard objectives add opt_lava_speed trigger
scoreboard objectives add opt_build_height trigger
scoreboard objectives add opt_vil_resp_cd trigger
scoreboard objectives add opt_gravel trigger
scoreboard objectives add opt_snowball trigger
scoreboard objectives add opt_vil_respawn trigger
scoreboard objectives add opt_instant_pil trigger
scoreboard objectives add opt_perf_mode trigger
scoreboard objectives add opt_team_egg trigger
scoreboard objectives add opt_wb_size_add trigger
scoreboard objectives add opt_regen trigger
scoreboard objectives add opt_fall_damage trigger
scoreboard objectives add opt_resp_delay trigger

scoreboard objectives add opt_random_team trigger
scoreboard objectives add opt_team_number trigger

#internal values
scoreboard objectives add global dummy
scoreboard objectives add options dummy
scoreboard objectives add YEntity dummy
scoreboard objectives add usedSnowball minecraft.used:minecraft.snowball
scoreboard objectives add gameId dummy

scoreboard objectives add killed deathCount
scoreboard objectives add bluePlaced minecraft.used:squid_spawn_egg
scoreboard objectives add greenPlaced minecraft.used:slime_spawn_egg
scoreboard objectives add redPlaced minecraft.used:mooshroom_spawn_egg
scoreboard objectives add yellowPlaced minecraft.used:blaze_spawn_egg

scoreboard players set #20 global 20
scoreboard players set #10 global 10

execute unless score GameId global matches 0.. run scoreboard players set GameId global 0


#Configuration scores
execute unless score LavaSpeed options matches 1.. run scoreboard players set LavaSpeed options 10
execute unless score BuildHeight options matches 2.. run scoreboard players set BuildHeight options 10

execute unless score Island options matches 0.. run scoreboard players set BuildHeight options 1
execute unless score IslandTimeSpawn options matches 1.. run scoreboard players set BuildHeight options 30
execute unless score IslandFirstSpawn options matches 1.. run scoreboard players set BuildHeight options 60


execute unless score VillagerForgiveness options matches 0.. run scoreboard players set VillagerForgiveness options 1
execute unless score VillagerRespawn options matches 0.. run scoreboard players set VillagerRespawn options 30

execute unless score UseGravel options matches 0.. run scoreboard players set UseGravel options 1
execute unless score UseSnowball options matches 0.. run scoreboard players set UseSnowball options 0

execute unless score InstantPillar options matches 0.. run scoreboard players set InstantPillar options 0
execute unless score TeamEgg options matches 0.. run scoreboard players set TeamEgg options 0

execute unless score PerformanceMode options matches 0.. run scoreboard players set PerformanceMode options 0
execute unless score WBSize options matches 15..165 run scoreboard players set WBSize options 95

execute unless score Regen options matches 0.. run scoreboard players set Regen options 1
execute unless score FallDamage options matches 0.. run scoreboard players set FallDamage options 0

execute unless score TeamNumber options matches 2.. run scoreboard players set TeamNumber options 4
execute unless score RandomTeam options matches 0.. run scoreboard players set RandomTeam options 0

execute unless score DevelopementMode global matches 1.. run scoreboard players set DevelopementMode global 0

#advancement replenish
advancement revoke @a from scaffolding_rush:replenish

#teams
team add red
team add blue
team add yellow
team add green
team add random

team add pink
team add light_blue
team add magenta
team add orange
team add white

team add gray
team add light_gray
team add cyan
team add purple
team add brown

team add dark_green
team add black

team modify red color red
team modify blue color blue
team modify yellow color yellow
team modify green color green
team modify random color dark_purple

team modify pink color light_purple
team modify light_blue color aqua
team modify magenta color dark_purple
team modify orange color yellow
team modify white color white

team modify gray color dark_gray
team modify light_gray color gray
team modify cyan color dark_aqua
team modify purple color dark_purple
team modify brown color gold

team modify dark_green color dark_green
team modify black color black

team modify red collisionRule never
team modify blue collisionRule never
team modify yellow collisionRule never
team modify green collisionRule never
team modify random collisionRule never
team modify red friendlyFire false
team modify blue friendlyFire false
team modify yellow friendlyFire false
team modify green friendlyFire false
team modify random friendlyFire false

#worldborder
worldborder warning distance 1
worldborder damage amount 0

function scaffolding_rush:options/wb_size_refresh

#time
time set noon

#gamerule
gamerule announceAdvancements true
gamerule commandBlockOutput false
gamerule disableElytraMovementCheck false
gamerule disableRaids true
gamerule doDaylightCycle false
gamerule doEntityDrops true
gamerule doFireTick false
gamerule doImmediateRespawn true
gamerule doInsomnia false
gamerule doLimitedCrafting
gamerule doMobLoot true
gamerule doMobSpawning false
gamerule doPatrolSpawning false
gamerule doTileDrops false
gamerule doTraderSpawning false
gamerule doWeatherCycle false
gamerule drowningDamage true
gamerule fallDamage false
gamerule fireDamage true
gamerule forgiveDeadPlayers true
gamerule keepInventory true
gamerule logAdminCommands true
gamerule maxCommandChainLength 65536
gamerule maxEntityCramming 24
gamerule mobGriefing true
gamerule naturalRegeneration true
gamerule randomTickSpeed 3
gamerule reducedDebugInfo false
gamerule sendCommandFeedback false
gamerule showDeathMessages true
gamerule spawnRadius 0
gamerule spectatorsGenerateChunks false
gamerule universalAnger false

setworldspawn 0 4 0

execute unless entity @e[type=area_effect_cloud,name="✔"] run summon minecraft:area_effect_cloud 0 0 0 {Duration:2147483647, CustomName:'{"text":"✔","color":"green"}'}
execute unless entity @e[type=area_effect_cloud,name="✖"] run summon minecraft:area_effect_cloud 0 0 0 {Duration:2147483647, CustomName:'{"text":"✖","color":"red"}'}

#Bossbar
bossbar add filling_lava ""
bossbar set minecraft:filling_lava color red

#debug / à changer
#say [SR] init done (reset in progress)
#playsound ui.toast.in ambient @a
function scaffolding_rush:reset
#say [SR] reset done
#playsound ui.toast.out ambient @a
#teleport @a 0 3 0 0 0
#gamerule sendCommandFeedback true
