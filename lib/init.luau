--!strict
--[[
    QueryAuth
    A fully type-safe permissions module for Roblox Luau.

	For more information, check out the GitHub: https://github.com/PossiblePanda/QueryAuth
]]

local QueryAuthTypes = require(script.Types)

local DefaultAuthConditionsFolder = script.DefaultAuthConditions

local QueryAuth = {}

type AuthCondition = QueryAuthTypes.AuthCondition
type Policy = QueryAuthTypes.Policy

export type QueryAuthModule = {
	Team: (values: {string}?) -> AuthCondition,
	UserId: (values: {number}?) -> AuthCondition,
	GetPolicy: (policy: Policy) -> AuthCondition,

	all: (conditions: {AuthCondition}) -> AuthCondition,
	one: (conditions: {AuthCondition}) -> AuthCondition,
	has: (amount: number, conditions: {AuthCondition}) -> AuthCondition,
}

--[[
    Combines multiple AuthConditions and only passes if *all* conditions are true.
    @param conditions {AuthCondition} - List of conditions to evaluate.
    @return AuthCondition - A lambda that evaluates to see if ALL conditions are true.
]]
function QueryAuth.all(conditions: {AuthCondition}): AuthCondition
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
function QueryAuth.one(conditions: {AuthCondition}): AuthCondition
	return QueryAuth.has(1, conditions)
end

--[[
    Combines multiple AuthConditions and only passes if *amount* conditions are true.
    @param amount number - The amount of conditions that must pass.
    @param conditions {AuthCondition} - List of conditions to evaluate.
    @return AuthCondition - A lambda that evaluates to see if the amount of conditions are true.
]]
function QueryAuth.has(amount: number, conditions: {AuthCondition}): AuthCondition
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

-- Add auth functions
QueryAuth.Team = require(DefaultAuthConditionsFolder.Team)
QueryAuth.UserId = require(DefaultAuthConditionsFolder.UserId)
QueryAuth.GetPolicy = require(DefaultAuthConditionsFolder.GetPolicy)

return QueryAuth :: QueryAuthModule