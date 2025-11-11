local BadgeService = game:GetService("BadgeService")
local QueryAuthTypes = require(script.Parent.Parent.Types)

type AuthCondition = QueryAuthTypes.AuthCondition

--[[
    Checks if the player owns the badge with the given badge ID.
    @param badgeId number - The badge ID to check against.
    @return AuthCondition - A lambda that evaluates to see if the player owns the specified badge.
]]
return function(badgeId: number): AuthCondition
	return function(player: Player): boolean
		return BadgeService:UserHasBadgeAsync(player.UserId, badgeId)
	end
end
