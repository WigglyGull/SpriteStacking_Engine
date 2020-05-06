local spriteTable = require("tools/spriteTable")
local hero_atlas
local hero_sprite

local angle = 0

local canvas = love.graphics.newCanvas(176, 99)
local scale = love.graphics.getWidth() / canvas:getWidth()

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    canvas:setFilter("nearest", "nearest")

    hero_atlas = love.graphics.newImage("assets/gfx/hero.png")
    hero_sprite = love.graphics.newQuad(16, 32, 16, 16, hero_atlas:getDimensions())
    
    player = spriteTable:CreateSprite("assets/gfx/player.png", 21, 16, 26)
    shadow = spriteTable:CreateSprite("assets/gfx/shadow.png", 21, 16, 26)
end

function love.update(dt)
    angle = angle + 27.5 * dt
end

function love.draw()
    love.graphics.setCanvas(canvas)
    love.graphics.clear(103/255, 177/255, 75/255)

    love.graphics.setColor(1,1,1,0.1)
    spriteTable:StackSprite(shadow, angle, 88, 49.5, true)
    love.graphics.setColor(1,1,1,1)
    spriteTable:StackSprite(player, angle, 88, 49.5, false)

    love.graphics.setCanvas()
    love.graphics.draw(canvas, 0, 0, 0, scale, scale)
end