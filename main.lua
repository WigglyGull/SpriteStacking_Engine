require("engineTools/camera")

local utils = require("utils")
local spriteTable = require("engineTools/spriteTable")
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

local screenWidth, screenHeight = 192, 108
local canvas = love.graphics.newCanvas(screenWidth, screenHeight)
local scale = love.graphics.getWidth() / canvas:getWidth()

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
    gameLoop:update(dt)

    camera.x = player.position.x - screenWidth / 2
    camera.y = player.position.y - screenHeight / 2

    if(love.mouse.isDown(1)) then
        camera:rotate(math.rad(1))
    elseif(love.mouse.isDown(2)) then
        camera:rotate(math.rad(-1))
    end
end 

function love.draw()
    love.graphics.setCanvas(canvas)
    love.graphics.clear(103/255, 177/255, 75/255)
    camera:set()

    renderer:render()

    camera:unset()
    love.graphics.setCanvas()
    love.graphics.draw(canvas, 0, 0, 0, scale, scale)
end