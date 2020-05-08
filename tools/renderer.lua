local class = require("modules/class")
local Renderer = class:derive("Renderer")

local numOfLayers = 5
local insert = table.insert 
local remove = table.remove

function Renderer:new()
    self.drawers = {}
    for i = 0, numOfLayers do 
        self.drawers[i] = {}
    end
end

function Renderer:addRenderer(obj, layer)
    local l = layer or 0
    insert(self.drawers[l], obj)
end

function Renderer:render()
    for layer = 0,#self.drawers do 
        for draw = 0,#self.drawers[layer] do 
            local obj = self.drawers[layer][draw]
            if obj ~= nil then
                obj:render()
            end
        end
    end
end

return Renderer