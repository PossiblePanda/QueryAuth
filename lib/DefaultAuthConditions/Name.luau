local QueryAuthTypes = require(script.Parent.Parent.Types)

type AuthCondition = QueryAuthTypes.AuthCondition

--[[
    Checks if a player's Name matches the ones passed in `...`.
    @param ... string|{string} - Names to check against. If nothing is passed, no Name will pass.
    @return AuthCondition - A lambda that evaluates to see if the player's Name matches the ones passed in `...`.
]]
return function(...: string|{string}): AuthCondition
    local values = {}

    for i = 1, select('#', ...) do
        local str: string|{string} = select(i, ...)

        if typeof(str) == 'string' then
            table.insert(values, str)
        elseif typeof(str) == 'table' then
            table.move(str, 1, #str, #values+1, values)
        end
    end

    return function(player: Player): boolean
		return values ~= nil and table.find(values, player.Name) ~= nil
	end
end