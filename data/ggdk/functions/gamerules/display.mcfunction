
tellraw @s [{"text": "░░░░░░","color": "dark_gray"},{"text": " GGDK gamerules ","color": "white"},{"text": "░░░░░░","color": "dark_gray"}]

execute if score $ggdk.do_effects ggdk.CONST matches 1.. run tellraw @s [{"text": "doEffects: "},{"text": "[true]","color": "green"}]
execute if score $ggdk.do_effects ggdk.CONST matches ..0 run tellraw @s [{"text": "doEffects: "},{"text": "[false]","color": "red"}]

execute if score $ggdk.do_drunkness ggdk.CONST matches 1.. run tellraw @s [{"text": "doDrunkness: "},{"text": "[true]","color": "green"}]
execute if score $ggdk.do_drunkness ggdk.CONST matches ..0 run tellraw @s [{"text": "doDrunkness: "},{"text": "[false]","color": "red"}]

tellraw @s [{"text": "soberSpeed: "},{"score": {"name": "$ggdk.speed","objective": "ggdk.CONST"},"color": "yellow"}]

tellraw @s [{"text": "level: "}]
tellraw @s [{"text": "- 0: "},{"score": {"name": "$ggdk.lvl_0","objective": "ggdk.CONST"},"color": "yellow"}]
tellraw @s [{"text": "- 1: "},{"score": {"name": "$ggdk.lvl_1","objective": "ggdk.CONST"},"color": "yellow"}]
tellraw @s [{"text": "- 2: "},{"score": {"name": "$ggdk.lvl_2","objective": "ggdk.CONST"},"color": "yellow"}]
tellraw @s [{"text": "- 3: "},{"score": {"name": "$ggdk.lvl_3","objective": "ggdk.CONST"},"color": "yellow"}]