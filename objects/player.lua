local spriteTable = require("tools/spriteTable")
local Vec2 = require("module/vector2")
local helperFuncs = require("tools/helperFunctions")
local Player = {}

function Player:Create()
    player = {}

    playerSprite = spriteTable:CreateSprite("assets/gfx/player.png", 21, 32, 32)
    shadow = love.graphics.newImage("assets/gfx/shadow.png")

    player.position = Vec2:New()
    player.angle = 0
    player.axis = Vec2:New()

    local maxSpeed = 20000
    local acceleration = 4000
    local motion = Vec2:New()

    local key = love.keyboard.isDown
    local lookPos = Vec2:New(player.position.x+2, player.position.y+5)
    
    function player:Update(dt)
        player.axis = getAxis()
        if(player.axis.x == 0 and player.axis.y == 0) then
            applyFriction(acceleration * dt)
        else 
            setRotation()
            applyMovement(Vec2:New(player.axis.x * acceleration * dt, player.axis.y * acceleration * dt))
        end

        motion = Vec2:New(motion.x * dt, motion.y * dt)
        player.position.x = player.position.x + motion.x 
        player.position.y = player.position.y + motion.y
    end

    function player:Render()
        love.graphics.setColor(1,1,1,0.4)
        love.graphics.draw(shadow, player.position.x, player.position.y, player.angle, 1, 1, shadow:getWidth()/2, shadow:getHeight()/2)
        love.graphics.setColor(1,1,1,1)
        spriteTable:StackSprite(playerSprite, player.angle, player.position.x, player.position.y, false)
    end

    function getAxis()
        local axis = Vec2:New()
        axis.x = helperFuncs:boolToNumber(key("d")) - helperFuncs:boolToNumber(key("a"))
        axis.y = helperFuncs:boolToNumber(key("s")) - helperFuncs:boolToNumber(key("w"))
        return axis:normalized()
    end
    
    function applyFriction(amount)
        if(motion:length() > amount) then 
            local normalMotion = motion:normalized()
            motion.x = motion.x - normalMotion.x * amount
            motion.y = motion.y - normalMotion.y * amount
        else 
            motion = Vec2:New()
        end
    end
    
    function applyMovement(amount)
        motion = Vec2:New(motion.x + amount.x, motion.y + amount.y)
        if(motion:length() > maxSpeed) then
            motion = motion:normalized()
            motion.x = motion.x * maxSpeed
            motion.y = motion.y * maxSpeed
        end
    end

    function setRotation()
        lookPos = Vec2:New(player.position.x-player.axis.x, player.position.y+player.axis.y)
        direction = math.atan2(lookPos.x - player.position.x, lookPos.y - player.position.y)
        player.angle = helperFuncs:angleLerp(player.angle, direction, 0.1)
    end

    return player
end

return Player