--[[
    Checks to see if time (*t*) is greater or equal to time passed since the last time the condition returned true.
    @param time number - The time to check against, time unit depends on which function was passed on *mark*, but by default it's in seconds.
    @param mark function - An optional function which will be used to track intervals inside the function, defaults to `os.clock`
    @return AuthCondition - A lambda that returns true if passed time parameter is greater or equal to time passed since last truthy return.
]]
return function(time: number, mark: (()->number)?)
    local fn = if mark then mark else os.clock
    local last = 0

    return function(player: Player)
        local now = fn()
        if now - last >= time then
            last = now

            return true
        end

        return false
    end
end
