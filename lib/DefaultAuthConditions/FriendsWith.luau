local QueryAuthTypes = require(script.Parent.Parent.Types)

type AuthCondition = QueryAuthTypes.AuthCondition

--[[
    Checks to see if the player is friends with another player.
    @param otherPlayerId number - The UserId of the other player to check friendship with.
    @return AuthCondition - A lambda that returns true if the player is friends with the other player.
]]
return function(otherPlayerId: number): AuthCondition
	return function(player: Player): boolean
        return player:IsFriendsWith(otherPlayerId)
    end
end