scoreboard players set GameEnd global 1
scoreboard players set GameRunning global 0

function scaffolding_rush:broadcast/finish

schedule function scaffolding_rush:reset 3s
execute if score RandomTeam options matches 1 as @a[team=!] run team join random @s
