--!strict
--[[
    QueryAuth
    A fully type-safe permissions module for Roblox Luau.
]]

local Checks = require(script.Checks)
local QueryAuthTypes = require(script.Types)

local DefaultAuthConditionsFolder = script.DefaultAuthConditions

type AuthCondition = QueryAuthTypes.AuthCondition

export type QueryAuthModule = typeof(Checks) & {
	Team: (...string|{string}) -> AuthCondition,
	UserId: (...number|{number}) -> AuthCondition,
	Name: (...string|{string}) -> AuthCondition,
	IsStudio: AuthCondition,
}

local QueryAuth = (table.clone(Checks) :: QueryAuthModule)

-- Add auth functions
QueryAuth.Team = require(DefaultAuthConditionsFolder.Team)
QueryAuth.UserId = require(DefaultAuthConditionsFolder.UserId)
QueryAuth.Name = require(DefaultAuthConditionsFolder.Name)
QueryAuth.IsStudio = require(DefaultAuthConditionsFolder.IsStudio)

return table.freeze(QueryAuth) :: QueryAuthModule