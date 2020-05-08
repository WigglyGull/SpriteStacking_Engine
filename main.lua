local spriteTable = require("engineTools/spriteTable")
local utils = require("utils")

local GameLoop = require("tools/gameLoop")
local Renderer = require("tools/renderer")

local Player = require("objects/player")
local Grass = require("objects/grass")

local player = Player:Create()
local grass = Grass(20, 20)
local grass1 = Grass(192 - 20, 20)
local grass2 = Grass(20, 108 - 20)
local grass3 = Grass(192 - 20, 108 - 20)

local gameLoop = GameLoop()
local renderer = Renderer()

local hero_atlas
local hero_sprite

local angle = 0

local canvas = love.graphics.newCanvas(192, 108)
local scale = love.graphics.getWidth() / canvas:getWidth()

local x = 1

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    canvas:setFilter("nearest", "nearest")

    gameLoop:addLoop(player)

    renderer:addRenderer(grass)
    renderer:addRenderer(grass1)
    renderer:addRenderer(grass2)
    renderer:addRenderer(grass3)
    renderer:addRenderer(player)
end

function love.update(dt)
    -- player:Update(dt)
    gameLoop:update(dt)
end 

function love.draw()
    love.graphics.setCanvas(canvas)
    love.graphics.clear(103/255, 177/255, 75/255)

    renderer:render()

    love.graphics.setCanvas()
    love.graphics.draw(canvas, 0, 0, 0, scale, scale)
end