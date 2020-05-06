local spriteTable = require("tools/spriteTable")
local Player = require("objects/player")
local player = Player:Create()
local hero_atlas
local hero_sprite

local angle = 0

local canvas = love.graphics.newCanvas(256, 144)
local scale = love.graphics.getWidth() / canvas:getWidth()

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    canvas:setFilter("nearest", "nearest")

    hero_atlas = love.graphics.newImage("assets/gfx/hero.png")
    hero_sprite = love.graphics.newQuad(16, 32, 16, 16, hero_atlas:getDimensions())
end

function love.update(dt)
    player:Update(dt)
end

function love.draw()
    love.graphics.setCanvas(canvas)
    love.graphics.clear(103/255, 177/255, 75/255)

    player:Render()

    love.graphics.setCanvas()
    love.graphics.draw(canvas, 0, 0, 0, scale, scale)
end