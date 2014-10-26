local Plugin = {}

Plugin.HasConfig = true
Plugin.ConfigName = "enforceteamsize.json"
Plugin.DefaultConfig = {
    MaxPlayers = 16,
	TooManyMessage = "Please Spectate until the round ends."
}
Plugin.CheckConfig = true
Plugin.CheckConfigTypes = true

Plugin.DefaultState = false

function Plugin:Initialise()
    self.Enabled = true
    return true
end

function Plugin:JoinTeam(gamerules, player, newteam, force, ShineForce)
	if ShineForce or newteam == kSpectatorIndex or newteam == kTeamReadyRoom then return end
	return self:Check()
end

function Plugin:Check()	
	if #Shine.GetAllPlayers() > self.Config.MaxPlayers then
		return false
	end
end

function Plugin:Cleanup()
    --Cleanup your extra stuff like timers, data etc.
    self.BaseClass.Cleanup( self )
end

Shine:RegisterExtension("enforceteamsize", Plugin )