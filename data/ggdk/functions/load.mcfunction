#------ Setup objectives ------#
scoreboard objectives add ggdk.var dummy
scoreboard objectives add ggdk.CONST dummy

# If it's the first time using the pack, set the gamerules
execute unless data storage geegaz:ggdk static.Gamerules run data modify storage geegaz:ggdk static.Gamerules set value {doEffects:true,doDrunkness:true,soberSpeed:1,level:[120,210,360,600]}
# Then update the gamerule scores
function ggdk:gamerules/load

function ggdk:second