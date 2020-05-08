local class = require("modules/class")
local GameLoop = class:derive("GameLoop")

local insert = table.insert 
local remove = table.remove

function GameLoop:new()
    self.tickers = {}
end

function GameLoop:addLoop(obj)
    insert(self.tickers, obj)
end

function GameLoop:update(dt)
    for tickers = 0, #self.tickers do 
        local obj = self.tickers[tickers]
        if obj ~= nil then
            obj:update(dt)
        end
    end
end

return GameLoop