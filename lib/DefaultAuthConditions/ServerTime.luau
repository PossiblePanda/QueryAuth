local Workspace = game:GetService("Workspace")
local QueryAuthTypes = require(script.Parent.Parent.Types)

type AuthCondition = QueryAuthTypes.AuthCondition

--[[
    Checks to see if the server's time is greater or equal to the provided time.
    @param time number - The time to check against, in seconds.
    @return AuthCondition - A lambda that returns true if the server's time is greater or equal to the provided time.
]]
return function(time: number): AuthCondition
	return function(_player: Player): boolean

        return Workspace:GetServerTimeNow() >= time
    end
end