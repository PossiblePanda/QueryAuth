local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local QueryAuth = require(ReplicatedStorage.QueryAuth)

local plr = game.Players.LocalPlayer

local test = QueryAuth.any({
	QueryAuth.UserId(plr.UserId),
})

if test(plr) == true then
	print("🟢 Expected test1 to return true, got true")
else
	print("🔴 Expected test1 to return true, got false")
end

local test2 = QueryAuth.Policy("IsSubjectToChinaPolicies")
if test2(plr) == false then
	print("🟢 Expected test2 to return false, got false")
else
	print("🔴 Expected test2 to return false, got true")
end

local test3 = QueryAuth.Studio()
if test3(plr) == RunService:IsStudio() then
	print("🟢 Expected test3 to return true, got true")
else
	print("🔴 Expected test3 to return true, got false")
end

local test6 = QueryAuth.GlobalThrottle(1, 3)
do
	local passing = false

	local calls = {}

	for i = 1, 3 do
		calls[i] = test6(plr)
		task.wait(1)
	end

	passing = calls[1] == true and calls[2] == false and calls[3] == false

	if passing == true then
		print("🟢 Expected test6 to return true, got true")
	else
		print("🔴 Expected test6 to return false, got true")
	end
end

local test7 = QueryAuth.GlobalThrottle(1, 2)
do
	local passing = false

	local calls = {}

	for i = 1, 3 do
		calls[i] = test7(plr)
		task.wait(1)
	end

	passing = calls[1] == true and calls[2] == false and calls[3] == false

	if passing == true then
		print("🔴 Expected test7 to return false, got false")
	else
		print("🟢 Expected test7 to return false, got true")
	end
end
