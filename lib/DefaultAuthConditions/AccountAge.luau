local QueryAuthTypes = require(script.Parent.Parent.Types)

type AuthCondition = QueryAuthTypes.AuthCondition

--[[
    Checks if a player's account age meets the specified minimum and maximum days.
    @param minimum - Minimum account age in days.
    @param maximum - Maximum account age in days. If nil, no maximum is enforced.
    @return AuthCondition - A lambda that evaluates to see if the player's account age meets the criteria.
]]
return function(minimum: number, maximum: number?): AuthCondition
	return function(player: Player): boolean
		local age = player.AccountAge

        return age >= minimum and (maximum == nil or age <= maximum)
	end
end