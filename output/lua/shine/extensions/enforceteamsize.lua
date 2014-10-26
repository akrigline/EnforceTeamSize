local Plugin = {}

Plugin.HasConfig = true --Does this plugin have a config file?
Plugin.ConfigName = "enforceteamsize.json" --What's the name of the file?
Plugin.DefaultConfig = { --What's the default config setup?
    MaxPlayers = 16
}
Plugin.CheckConfig = true --Should we check for missing/unused entries when loading?
Plugin.CheckConfigTypes = true --Should we check the types of values in the config to make sure they match our default's types?

Plugin.DefaultState = false --Should the plugin be enabled when it is first added to the config?

function Plugin:JoinTeam(gamerules, player, newteam, force)
	local cancel = false
	if Shine.GetAllPlayers() > MaxPlayers then 
		cancel
	end
	if cancel then
		return false
	end
end

function Plugin:Initialise()
    self.Enabled = true
    return true
end

function Plugin:Cleanup()
    --Cleanup your extra stuff like timers, data etc.
    self.BaseClass.Cleanup( self )
end

Shine:RegisterExtension("enforceteamsizes", Plugin )