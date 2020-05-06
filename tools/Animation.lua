local class = require("modules/class")
local Anim = class:derive("Animation")
local Vector2 = require("modules/vector2")

function Anim:New(xoffset, yoffset, w, h, column_size, num_frames, fps)
    self.fps = fps
    self.timer = 1 / self.fps
    self.frame = 1
    self.num_frames = num_frames
    self.column_size = column_size
    self.start_offset = Vector2(xoffset, yoffset)
    self.offset = Vector2()
    self.size = Vector2(w, h)
end

function Anim:Update(dt)
    self.timer = self.timer - dt
    if (self.timer <= 0) then
        self.timer = 1 / self.fps
        self.frame = self.frame + 1
        if(self.frame > self.num_frames) then 
            self.frame = 1 
        end 
        self.offset.x = self.start_offset.x + (self.size.x * (self.frame - 1))
        self.offset.y = self.start_offset.y + (self.size.y * (self.frame - 1))
    end
end

return Anim