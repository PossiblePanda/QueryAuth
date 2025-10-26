local Types = require(script.Parent.Types)
local Checks = {}

type AuthCondition = Types.AuthCondition

--[[
    Combines multiple AuthConditions and only passes if *all* conditions are true.
    @param conditions {AuthCondition} - List of conditions to evaluate.
    @return AuthCondition - A lambda that evaluates to see if ALL conditions are true.
]]
function Checks.all(conditions: {AuthCondition}): AuthCondition
	return function(player: Player): boolean
		for _, condition in conditions do
			if not condition(player) then
				return false
			end
		end
		return true
	end
end

--[[
    Combines multiple AuthConditions and only passes if *one* condition is true.
    @param conditions {AuthCondition} - List of conditions to evaluate.
    @return AuthCondition - A lambda that evaluates to see if ONE conditions are true.
]]
function Checks.one(conditions: {AuthCondition}): AuthCondition
	return function(player: Player): boolean
		for _, condition in conditions do
			if condition(player) then
				return true
			end
		end
		
		return false
	end
end

--[[
    Combines multiple AuthConditions and only passes if *amount* conditions are true.
    @param amount number - The amount of conditions that must pass.
    @param conditions {AuthCondition} - List of conditions to evaluate.
    @return AuthCondition - A lambda that evaluates to see if the amount of conditions are true.
]]
function Checks.has(amount: number, conditions: {AuthCondition}): AuthCondition
	return function(player: Player): boolean
		local passed = 0
		for _, condition in conditions do
			if not condition(player) then continue end
			
			passed += 1
			if passed >= amount then
				return true
			end
		end
		return false
	end
end

--[[
	Returns an AuthCondition that passes only if *condition* doesn't.
	@param condition AuthCondition - The condition to negate
	@return AuthCondition - A lambda that eveluates to see if the condition didn't pass
]]
function Checks.negate(condition: AuthCondition)
	return function(player: Player)
		return not condition(player)
	end
end

return table.freeze(Checks)