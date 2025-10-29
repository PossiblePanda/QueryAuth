local QueryAuthTypes = require(script.Parent.Parent.Types)
local PolicyService = game:GetService("PolicyService")

type AuthCondition = QueryAuthTypes.AuthCondition
type Policy = QueryAuthTypes.Policy

--[[
    Checks if PolicyService allows the specified policy for the player.
    @param policy Policy - The policy to check.
    @return AuthCondition - A lambda that returns the value PolicyService provides.
]]
return function(policy: Policy): AuthCondition
	return function(player: Player): boolean
        local success, result = pcall(function()
            return PolicyService:GetPolicyInfoForPlayerAsync(player)
        end)

        if not success then return false end

        return result[policy]
    end
end