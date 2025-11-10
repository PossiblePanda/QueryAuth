local QueryAuthTypes = require(script.Parent.Parent.Types)

type AuthCondition = QueryAuthTypes.AuthCondition

--[[
    Checks if a player's UserId is in the provided list of UserIds.
    @param values {number}? - List of UserIds to check against. If nil, no UserId will pass.
    @return AuthCondition - A lambda that evaluates to see if the player's UserId is in the list.
]]
return function(values: number?): AuthCondition
	return function(player: Player): boolean
		return values ~= nil and player.UserId == values
	end
end