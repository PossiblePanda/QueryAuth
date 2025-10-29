local QueryAuthTypes = require(script.Parent.Parent.Types)

type AuthCondition = QueryAuthTypes.AuthCondition

--[[
    Checks to see if the player has premium.
    @return AuthCondition - A lambda that returns true if the player has premium.
]]
return function(): AuthCondition
	return function(player: Player): boolean
        return player.MembershipType == Enum.MembershipType.Premium
    end
end