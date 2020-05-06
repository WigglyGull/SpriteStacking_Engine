local spriteTable = require("tools/spriteTable")
local Player = {}

function Player:Create()
    player = {}

    playerSprite = spriteTable:CreateSprite("assets/gfx/player.png", 21, 16, 26)
    shadow = spriteTable:CreateSprite("assets/gfx/shadow.png", 21, 16, 26) 

    player.x = 64
    player.y = 32
    
    
    function player:Update(dt)
        player.angle = math.atan2((love.mouse.getY() - player.y), (love.mouse.getX() - player.x))  
    end

    function player:Render()
        love.graphics.setColor(1,1,1,0.1)
        spriteTable:StackSprite(shadow, player.angle, player.x, player.y, true)
        love.graphics.setColor(1,1,1,1)
        spriteTable:StackSprite(playerSprite, player.angle, player.x, player.y, false)
    end

    return player
end

return Player