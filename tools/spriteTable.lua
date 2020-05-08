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

function SpriteTable:StackSprite(spriteTable, angle, x, y, offset)
    sprite_strip = love.graphics.newImage(spriteTable.source)
    offset = offset or 1
    
    for i=0, #spriteTable do 
        love.graphics.draw(sprite_strip, spriteTable[i], x, y-(i*spriteTable.scale)*offset, angle, spriteTable.scale, spriteTable.scale, spriteTable.width, spriteTable.height)
    end
end

return SpriteTable