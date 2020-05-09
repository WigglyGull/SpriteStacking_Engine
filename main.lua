local Camera = require("engineTools/camera")
local camera = Camera.new(-100, -100, 4000, 4000)

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
local angle = 0

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    spriteTable:GetCamera(camera)

    gameLoop:addLoop(player)
    renderer:addRenderer(grass)
    renderer:addRenderer(grass1)
    renderer:addRenderer(grass2)
    renderer:addRenderer(grass3)
    renderer:addRenderer(player)
end

function love.update(dt)
    gameLoop:update(dt)

    spriteTable:GetCamera(camera)

    camera:setPosition(player.position.x, player.position.y)
    camera:setScale(3)
    if(love.mouse.isDown(1))then
        angle = angle + 1
    elseif(love.mouse.isDown(2)) then
        angle = angle - 1
    end
    camera:setAngle(math.rad(angle))
end 

function love.draw()
    love.graphics.clear(103/255, 177/255, 75/255)

    camera:draw(function()
        renderer:render()
    end)
end