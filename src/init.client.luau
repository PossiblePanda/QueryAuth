local ReplicatedStorage = game:GetService("ReplicatedStorage")
local QueryAuth = require(ReplicatedStorage.QueryAuth)

local plr = game.Players.LocalPlayer

local test = QueryAuth.one {
    QueryAuth.UserId({plr.UserId}),
}

if test(plr) == true then
    print("Expected test1 to return true, got true")
else
    print("Expected test1 to return true, got false")
end