local spriteTable = require("tools/spriteTable")
local Vec2 = require("module/vector2")
local Player = {}

function Player:Create()
    player = {}

    playerSprite = spriteTable:CreateSprite("assets/gfx/player.png", 21, 32, 32)
    shadow = love.graphics.newImage("assets/gfx/shadow.png")

    player.x = 128
    player.y = 64
    player.angle = 0

    local key = love.keyboard.isDown
    local lookPos = Vec2:New(player.x, player.y)
    
    function player:Update(dt)
        local speed = 100 * dt

        if(key("w")) then
            player.y = player.y - speed
            lookPos = Vec2:New(player.x-2, player.y-5)
        elseif(key("s")) then
            player.y = player.y + speed
            lookPos = Vec2:New(player.x+2, player.y+5)
        elseif(key("a")) then
            player.x = player.x - speed
            lookPos = Vec2:New(player.x-5, player.y+2)
        elseif(key("d")) then
            player.x = player.x + speed
            lookPos = Vec2:New(player.x+5, player.y-2)
        end

        direction = math.atan2(((lookPos.y) - player.y), ((lookPos.x) - player.x)) - 20
        player.angle = direction
    end

    function player:Render()
        love.graphics.setColor(1,1,1,0.4)
        love.graphics.draw(shadow, player.x, player.y, player.angle, 1, 1, shadow:getWidth()/2, shadow:getHeight()/2)
        love.graphics.setColor(1,1,1,1)
        spriteTable:StackSprite(playerSprite, player.angle, player.x, player.y, false)
    end

    return player
end

return Player