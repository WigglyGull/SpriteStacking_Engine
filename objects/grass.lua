local class = require("modules/class")
local Grass = class:derive("Grass")

local spriteTable = require("engineTools/spriteTable")
local Vec2 = require("modules/vector2")
math.randomseed(os.time())

function Grass:new(x, y)
    x = x or 0
    y = y or 0
    self.z = 0
    self.position = Vec2:New(x, y)

    self.angle = 0
    self.angle = self.angle + math.random(0, 100)

    self.grassSprite = spriteTable:CreateSprite("assets/grass/grass.png", 11, 16, 16)
end

function Grass:render()
    spriteTable:StackSprite(self.grassSprite, self.angle, self.position.x, self.position.y, 1, z)
end

return Grass