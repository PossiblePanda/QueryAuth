local RunService = game:GetService("RunService")
local QueryAuthTypes = require(script.Parent.Parent.Types)

type AuthCondition = QueryAuthTypes.AuthCondition

--[[
    Checks to see if the game is running in studio.
    @return AuthCondition - A lambda that returns true if game is running in studio.
]]
return function(): AuthCondition
	return function(_player: Player): boolean
        return RunService:IsStudio()
    end
end