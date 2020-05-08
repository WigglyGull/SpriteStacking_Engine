local class = require("modules/class")
local Grass = class:derive("Grass")

local spriteTable = require("engineTools/spriteTable")
local Vec2 = require("modules/vector2")

function Grass:new(x, y)
    x = x or 0
    y = y or 0

    math.randomseed(os.time())
    self.angle = math.random(100)

    self.position = Vec2:New(x, y)
    self.grassSprite = spriteTable:CreateSprite("assets/grass/grass.png", 11, 16, 16)
end

function Grass:render()
    spriteTable:StackSprite(self.grassSprite, self.angle, self.position.x, self.position.y)
end

return Grass