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

    local AlienCount = gamerules:GetTeam2():GetNumPlayers()
    local MarineCount = gamerules:GetTeam1():GetNumPlayers()

    --Sum of playing ppl
    local TotalCount = AlienCount + MarineCount

    --Check if the sum is above MaxPlayers
    if TotalCount > self.Config.MaxPlayers then
        --Inform player (change rgb code to whatever you like)
        Shine:NotifyDualColour( player, 0, 255, 0, "EnforcedTeamsize", 255, 255, 255, self.Config.TooManyMessage )
        return false
    end
end

Shine:RegisterExtension("enforceteamsize", Plugin )
