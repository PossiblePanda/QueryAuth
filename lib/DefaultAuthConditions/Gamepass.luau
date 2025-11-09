local MarketplaceService = game:GetService("MarketplaceService")
local QueryAuthTypes = require(script.Parent.Parent.Types)

type AuthCondition = QueryAuthTypes.AuthCondition

--[[
    Checks if the player owns the gamepass with the given asset ID.
    @param gamepass number - The gamepass asset ID to check against.
    @return AuthCondition - A lambda that evaluates to see if the player owns the specified gamepass.
]]
return function(gamepassId: number): AuthCondition
	return function(player: Player): boolean
		return MarketplaceService:UserOwnsGamePassAsync(player.UserId, gamepassId)
    end
end