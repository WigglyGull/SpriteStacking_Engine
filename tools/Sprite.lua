local class = require("modules/class")
local Sprite = class:Derive("Sprite")

function Sprite:New()
    self.animations = {}
end

function Sprite:Animate(anim_name)
    
end

function Sprite:Tick(dt)
    
end

function Sprite:Render()
    
end

return Sprite