local RunService = game:GetService("RunService")

local QueryAuthTypes = require(script.Parent.Parent.Types)

type AuthCondition = QueryAuthTypes.AuthCondition

--[[
    Returns true if the game is running inside studio. Same as binding a function to `RunService:IsStudio()`
    @return boolean - Returns true if the game is being ran inside studio
]]
return function()
	return RunService:IsStudio()
end