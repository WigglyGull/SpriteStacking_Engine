local spriteTable = require("tools/spriteTable")
local Vec2 = require("module/vector2")

local class = require("module/class")
local Grass = class:derive("Animation")

function Grass:New()
    math.randomseed(os.time())
    self.angle = math.random(100)

    self.position = Vec2:New()
    self.grassSprite = spriteTable:CreateSprite("assets/grass/grass.png", 11, 16, 16)
end

function Grass:Render()
    spriteTable:StackSprite(self.grassSprite, self.angle, self.position.x, self.position.y)
end

return Grass