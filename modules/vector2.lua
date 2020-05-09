-- Haven't got around to rewriting it because I already used it so many times :(
local Vec2 = {}

function Vec2:New(x, y)
    local vec2 = {}

    vec2.x = x or 0
    vec2.y = y or 0

    function vec2:Move(nx, ny, dt)
        local  delta = dt or 1
        self.x = self.x + nx * delta
        self.y = self.y + ny * delta
    end

    function vec2:normalized()
        local newVec2 = vec2
        local length = self:length()
    
        if length > 0 then
            newVec2.x = newVec2.x / length
            newVec2.y = newVec2.y / length
        end

        return newVec2
    end

    function vec2:length()
        return math.sqrt(self.x * self.x + self.y * self.y)
      end

    return vec2
end

return Vec2