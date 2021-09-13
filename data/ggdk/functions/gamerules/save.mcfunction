
# Set storage from CONST scores
execute store success storage geegaz:ggdk static.Gamerules.doEffects byte 1.0 if score $ggdk.do_effects ggdk.CONST matches 1..
execute store success storage geegaz:ggdk static.Gamerules.doDrunkness byte 1.0 if score $ggdk.do_drunkness ggdk.CONST matches 1..
execute store result storage geegaz:ggdk static.Gamerules.soberSpeed int 1.0 run scoreboard players get $ggdk.speed ggdk.CONST
execute store result storage geegaz:ggdk static.Gamerules.level[0] int 1.0 run scoreboard players get $ggdk.lvl_0 ggdk.CONST
execute store result storage geegaz:ggdk static.Gamerules.level[1] int 1.0 run scoreboard players get $ggdk.lvl_1 ggdk.CONST
execute store result storage geegaz:ggdk static.Gamerules.level[2] int 1.0 run scoreboard players get $ggdk.lvl_2 ggdk.CONST
execute store result storage geegaz:ggdk static.Gamerules.level[3] int 1.0 run scoreboard players get $ggdk.lvl_3 ggdk.CONST