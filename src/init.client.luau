local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
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

local test2 = QueryAuth.GetPolicy("IsSubjectToChinaPolicies")
if test2(plr) == false then
    print("Expected test2 to return false, got false")
else
    print("Expected test2 to return false, got true")
end

local test3 = QueryAuth.InStudio()
if test3(plr) == RunService:IsStudio() then
    print("Expected test3 to return true, got true")
else
    print("Expected test3 to return true, got false")
end

print(QueryAuth.HasPremium()(plr))