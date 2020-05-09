local spriteTable = require("engineTools/spriteTable")
local Vec2 = require("modules/vector2")
local utils = require("utils")
local anim = require("engineTools/animator")

local Player = {}

function Player:Create()
    player = {}

    local runAnim = anim(5, 11)
    playerRunAnimation = {}
    playerRunAnimation[1] = spriteTable:CreateSprite("assets/playerRun/playerRun0.png", 21, 32, 32)
    playerRunAnimation[2] = spriteTable:CreateSprite("assets/playerRun/playerRun1.png", 21, 32, 32)
    playerRunAnimation[3] = spriteTable:CreateSprite("assets/playerRun/playerRun4.png", 21, 32, 32)
    playerRunAnimation[4] = spriteTable:CreateSprite("assets/playerRun/playerRun2.png", 21, 32, 32)
    playerRunAnimation[5] = spriteTable:CreateSprite("assets/playerRun/playerRun3.png", 21, 32, 32)
    playerRunAnimation[6] = spriteTable:CreateSprite("assets/playerRun/playerRun4.png", 21, 32, 32)

    playerIdleAnimation = spriteTable:CreateSprite("assets/gfx/player.png", 21, 32, 32)

    shadow = love.graphics.newImage("assets/gfx/shadow.png")

    player.position = Vec2:New(62, 32)
    player.angle = 0
    player.axis = Vec2:New()

    local maxSpeed = 18000
    local acceleration = 4000
    local motion = Vec2:New()
    local moving = false

    local offset = 1
    local up = false

    local key = love.keyboard.isDown
    local lookPos = Vec2:New(player.position.x+2, player.position.y+5)
    
    function player:update(dt)
        player.axis = getAxis()
        if(player.axis.x == 0 and player.axis.y == 0) then
            applyFriction(acceleration * dt)
            moving = false
        else 
            setRotation()
            moving = true
            applyMovement(Vec2:New(player.axis.x * acceleration * dt, player.axis.y * acceleration * dt))
        end

        motion = Vec2:New(motion.x * dt, motion.y * dt)
        player.position.x = player.position.x + motion.x 
        player.position.y = player.position.y + motion.y

        if(offset <= 0.8) then up = true
        elseif(offset >= 1) then up = false end

        if(moving == false) then 
            if(up == false) then offset = utils:Lerp(offset, 0.75, 0.01)
            else offset = utils:Lerp(offset, 1.1, 0.02) end
        else 
            if(up == false) then offset = utils:Lerp(offset, 0.75, 0.05)
            else offset = utils:Lerp(offset, 1.1, 0.06) end
        end

        runAnim:Update(dt, playerRunAnimation)
    end

    function player:render()
        love.graphics.setColor(1,1,1,0.4)
        love.graphics.draw(shadow, player.position.x, player.position.y, player.angle, 1, 1, shadow:getWidth()/2, shadow:getHeight()/2)

        love.graphics.setColor(1,1,1,1)
        if(moving == true) then
            spriteTable:StackSprite(playerRunAnimation[runAnim.frame], player.angle, player.position.x, player.position.y, offset)
        else 
            spriteTable:StackSprite(playerIdleAnimation, player.angle, player.position.x, player.position.y, offset)
        end
    end

    function getAxis()
        local axis = Vec2:New()
        axis.x = utils:boolToNumber(key("d")) - utils:boolToNumber(key("a"))
        axis.y = utils:boolToNumber(key("s")) - utils:boolToNumber(key("w"))
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
        player.angle = utils:angleLerp(player.angle, direction, 0.1)
    end

    return player
end

return Player