execute as @a[scores={opt_preset=1..}] run function scaffolding_rush:options/preset
execute as @a[scores={opt_build_height=1..}] run function scaffolding_rush:options/build_height
execute as @a[scores={opt_gravel=1..}] run function scaffolding_rush:options/gravel
execute as @a[scores={opt_instant_pil=1..}] run function scaffolding_rush:options/instant_pillar
execute as @a[scores={opt_lava_speed=1..}] run function scaffolding_rush:options/lava_speed
execute as @a[scores={opt_perf_mode=1..}] run function scaffolding_rush:options/perf_mode
execute as @a[scores={opt_snowball=1..}] run function scaffolding_rush:options/snowball
execute as @a[scores={opt_perf_mode=1..}] run function scaffolding_rush:options/perf_mode
execute as @a[scores={opt_team_egg=1..}] run function scaffolding_rush:options/team_egg
execute as @a[scores={opt_vil_resp_cd=1..}] run function scaffolding_rush:options/vil_resp_cd
execute as @a[scores={opt_vil_respawn=1..}] run function scaffolding_rush:options/vil_respawn
execute as @a[scores={opt_wb_size_add=1..}] run function scaffolding_rush:options/wb_size_add
execute as @a[scores={opt_wb_size_add=..-1}] run function scaffolding_rush:options/wb_size_add
execute if entity @a[scores={opt_regen=1..}] run function scaffolding_rush:options/regen
execute if entity @a[scores={opt_fall_damage=1..}] run function scaffolding_rush:options/fall_damage
execute as @a[scores={opt_random_team=1..}] run function scaffolding_rush:options/random_team
execute as @a[scores={opt_team_number=1..}] run function scaffolding_rush:options/team_number
execute as @a[scores={opt_resp_delay=1..}] run function scaffolding_rush:options/respawn_delay

execute as @a[scores={opt_island=1..}] run function scaffolding_rush:options/island
execute as @a[scores={opt_island_first=1..}] run function scaffolding_rush:options/island_first_delay
execute as @a[scores={opt_island_spawn=1..}] run function scaffolding_rush:options/island_spawn_delay
