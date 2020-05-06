local SpriteTable = {}

function SpriteTable:CreateSprite(source, num_frames, width, height, scale)
    spriteTable = {}
    spriteTable.source = source
    spriteTable.width = width/2
    spriteTable.height = height/2
    spriteTable.scale = scale or 1

    sprite_strip = love.graphics.newImage(source)
    yoffset = 0

    for i = 0, num_frames do 
        spriteTable[i] = love.graphics.newQuad(0, yoffset, width, height, sprite_strip:getDimensions())
        yoffset = yoffset + height
    end

    return spriteTable
end

function SpriteTable:StackSprite(spriteTable, angle, x, y, isShadow)
    angle = angle or 0
    sprite_strip = love.graphics.newImage(spriteTable.source)

    if(isShadow) then
        for i=0, #spriteTable do 
            love.graphics.draw(sprite_strip, spriteTable[i], x + i/2, y+i, math.rad(angle), spriteTable.scale, spriteTable.scale, spriteTable.width, spriteTable.height)
        end
    else 
        for i=0, #spriteTable do 
            love.graphics.draw(sprite_strip, spriteTable[i], x, y-i, math.rad(angle), spriteTable.scale, spriteTable.scale, spriteTable.width, spriteTable.height)
        end
    end
end

return SpriteTable