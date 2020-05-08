local spriteTable = require("tools/spriteTable")
local helperFuncs = require("tools/helperFunctions")

local Player = require("objects/player")
local Grass = require("objects/grass")

local player = Player:Create()
local grass = Grass()
local grass1 = Grass()

local hero_atlas
local hero_sprite

local angle = 0

local canvas = love.graphics.newCanvas(192, 108)
local scale = love.graphics.getWidth() / canvas:getWidth()

local x = 1

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    canvas:setFilter("nearest", "nearest")

    grass.position.x = 20
    grass.position.y = 20

    grass1.position.x = 192 - 20
    grass1.position.y = 20
end

function love.update(dt)
    player:Update(dt)
end 

function love.draw()
    love.graphics.setCanvas(canvas)
    love.graphics.clear(103/255, 177/255, 75/255)

    player:Render()
    grass:Render()
    grass1:Render()

    love.graphics.setCanvas()
    love.graphics.draw(canvas, 0, 0, 0, scale, scale)
end