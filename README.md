# What is QueryAuth?

QueryAuth is a type-safe permissions module for Roblox that allows for complicated permission checking logic, simplified into easy function calls.

## Features

- Blazingly Fast
- Fully Type-Safe
- Easy to add new conditions
- Simple syntax

## Examples
Below is an example of a simple permission made with QueryAuth.

```lua
local condition = QueryAuth.one { -- ONLY returns true if one or more conditions are true
    QueryAuth.UserId({123456}),
    QueryAuth.Team("Enemy"),

    QueryAuth.all { -- ONLY returns true if ALL conditions are true
        QueryAuth.UserId({654321}),
        QueryAuth.Team("Heroes")
    },

    function(plr: Player) -- Because conditions return a Lambda, you can just put a function in that returns a boolean!
        return RunService:IsStudio()
    end
}

print(condition())
```