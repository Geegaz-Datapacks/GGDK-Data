scoreboard players operation @s ggdk.var -= $ggdk.speed ggdk.CONST

execute if score @s ggdk.var >= $ggdk.lvl_0 ggdk.CONST run function ggdk:entity/player/levels/0
execute if score @s ggdk.var >= $ggdk.lvl_1 ggdk.CONST run function ggdk:entity/player/levels/1
execute if score @s ggdk.var >= $ggdk.lvl_2 ggdk.CONST run function ggdk:entity/player/levels/2
execute if score @s ggdk.var >= $ggdk.lvl_3 ggdk.CONST run function ggdk:entity/player/levels/3