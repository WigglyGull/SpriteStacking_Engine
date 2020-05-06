local spriteTable = require("tools/spriteTable")
local Player = {}

function Player:Create()
    player = {}

    playerSprite = spriteTable:CreateSprite("assets/gfx/player.png", 21, 16, 26)
    shadow = spriteTable:CreateSprite("assets/gfx/shadow.png", 21, 16, 26) 

    player.x = 128
    player.y = 64
    
    
    function player:Update(dt)
        player.angle = math.atan2(((love.mouse.getY() / 3) - player.y), ((love.mouse.getX() / 3) - player.x)) - 20
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