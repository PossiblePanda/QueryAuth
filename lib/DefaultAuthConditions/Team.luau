local QueryAuthTypes = require(script.Parent.Parent.Types)

type AuthCondition = QueryAuthTypes.AuthCondition

--[[
    Checks if a player's team name is in the provided list of team names.
    @param values {string}? - List of team names to check against. If nil, any team will pass.
    @return AuthCondition - A lambda that evaluates to see if the player's team name is in the list.
]]
return function(values: {string}?): AuthCondition
	return function(player: Player): boolean
        return values == nil or (player.Team ~= nil and table.find(values, player.Team.Name) ~= nil)
    end
end