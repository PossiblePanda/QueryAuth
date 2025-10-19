# What is QueryAuth?

QueryAuth is a type-safe permissions module for Roblox that allows for complicated permission checking logic, simplified into easy function calls.

# Installation
Currently, a prebuilt `.rbxl` file does not exist for QueryAuth, so if you want to use this in a non-wally project you will have to compile itself.

If you are using Wally, you can add `queryauth = "possiblepanda/queryauth@1.0.0"` under your `[dependencies]` in `wally.toml`.

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

    QueryAuth.all { -- ONLY returns true if ALL conditions are true. You can nest these because they return Lambdas.
        QueryAuth.UserId({654321}),
        QueryAuth.Team("Heroes")
    },

    function(plr: Player) -- Because conditions return a Lambda, you can just put a function in that returns a boolean!
        return RunService:IsStudio()
    end
}

print(condition()) -- Conditions are just functions, so you run them using parentheses.
```