local GroupService = game:GetService("GroupService")
local QueryAuthTypes = require(script.Parent.Parent.Types)

type AuthCondition = QueryAuthTypes.AuthCondition

--[[
    Checks if the player is in the specified group with an optional rank range.
    @param group_id number - The Roblox group ID to check against.
    @param min_rank number? | string? - The minimum rank the player must have in the group.
    @param max_rank number? | string? - The maximum rank the player can have in the group.
    @return AuthCondition - A lambda that evaluates to see if the player is in the specified group with the given rank range.
]]
return function(group_id: number, min_rank: number? | string?, max_rank: number? | string?): AuthCondition
    min_rank = min_rank or 1
    max_rank = max_rank or math.huge

	return function(player: Player): boolean
		local ok, info = pcall(function() 
            return GroupService:GetGroupInfoAsync(group_id) 
        end)
		if not ok then return false end

		local function toRank(v)
			if typeof(v) == "number" then return v end
			for _, r in info.Roles do
				if r.Name:lower() == tostring(v):lower() then
					return r.Rank
				end
			end

            return nil
		end

		local min, max = toRank(min_rank), toRank(max_rank)
		if not min or not max then return false end

		local rank = player:GetRankInGroup(group_id)
		return rank >= min and rank <= max
	end
end
