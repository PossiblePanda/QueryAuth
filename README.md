# What is QueryAuth?

QueryAuth is a type-safe permissions module for Roblox that allows for complicated permission checking logic, simplified into easy function calls.

## Installation
### Roblox Studio
If you are using just Roblox studio, or want to manually import the module, you can get the latest version from the [Releases](https://github.com/PossiblePanda/QueryAuth/releases) tab, OR get it from the [Creator Marketplace/Toolbox](https://create.roblox.com/store/asset/83237880339343/QueryAuth)

### Wally
If you are using Wally, simply just add `queryauth = "possiblepanda/queryauth@1.0.0"` under your `[dependencies]` in `wally.toml`.

### Pesde
If you are using Pesde, just run `pesde install possiblepanda/queryauth@1.0.0` to install the module.

## Features

- Blazingly Fast
- Fully Type-Safe
- Easy to add new conditions
- Simple syntax

## Examples
Below is an example of a simple permission made with QueryAuth.

```lua
local condition = QueryAuth.one { -- ONLY returns true if one or more conditions are true
    QueryAuth.UserId {123456},
    QueryAuth.Team {"Enemy"},

    QueryAuth.all { -- ONLY returns true if ALL conditions are true. You can nest these because they return Lambdas.
        QueryAuth.UserId {654321},
        QueryAuth.Team {"Heroes"}
    },

    function(plr: Player) -- Because conditions return a Lambda, you can just put a function in that returns a boolean!
        return RunService:IsStudio()
    end
}

print(condition()) -- Conditions are just functions, so you run them using parentheses.
```
