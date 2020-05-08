local class = require("module/class")
local Anim = class:derive("Animation")
local Vector2 = require("module/vector2")
local spriteTable = require("tools/spriteTable")

function Anim:New(num_frames, fps)
    self.fps = fps
    self.timer = 1 / self.fps
    self.frame = 1
    self.num_frames = num_frames
    self.animate = {}
end

function Anim:Reset()
    self.timer = 1 /self.fps
    self.frame = 1
end

function Anim:Update(dt, spritestack)
    if(self.num_frames <= 1) then return end

    self.timer = self.timer - dt
    if(self.timer <= 0) then
        self.timer = 1 / self.fps
        self.frame = self.frame + 1
        if self.frame > self.num_frames then 
            self.frame = 1 
        end
        self.animate = spritestack[frame]
    end
end

return Anim