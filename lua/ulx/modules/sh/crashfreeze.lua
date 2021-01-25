CATEGORY_NAME = "IFNET"

function ulx.crashfreeze( calling_ply, target_plys )
        for i=1, #target_plys do
                local v = target_plys[ i ]
                if IsValid(v) then
                        v:SendLua([[surface.PlaySound("ambient/alarms/combine_bank_alarm_loop4.wav")]])
                        timer.Simple( 0.5, function()v:SendLua([[while true do end]]) 
                        end)
                end
        end
        ulx.fancyLogAdmin( calling_ply, true, "#A crashfreeze le jeux de #T", affected_plys)
end
 
local crashfreeze = ulx.command( CATEGORY_NAME, "ulx crashfreeze", ulx.crashfreeze, "!crashfreeze" )
crashfreeze:addParam{ type=ULib.cmds.PlayersArg }
crashfreeze:defaultAccess( ULib.ACCESS_ADMIN )
crashfreeze:help( "Crash le jeux d'un joueur" )
