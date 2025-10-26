local QueryAuthTypes = require(script.Parent.Parent.Types)

type AuthCondition = QueryAuthTypes.AuthCondition

--[[
    Checks if a player's UserId matches the ones passed in `...`.
    @param ... number|{number} - UserIds to check against. If nothing is passed, no UserId will pass.
    @return AuthCondition - A lambda that evaluates to see if the player's UserIds matches the ones passed in `...`.
]]
return function(...: number|{number}): AuthCondition
    local values = {}

    for i = 1, select('#', ...) do
        local num: number|{number} = select(i, ...)

        if typeof(num) == 'number' then
            table.insert(values, num)
        elseif typeof(num) == 'table' then
            table.move(num, 1, #num, #values+1, values)
        end
    end

	return function(player: Player): boolean
		return values ~= nil and table.find(values, player.UserId) ~= nil
	end
end