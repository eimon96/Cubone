push = require 'libs/push'
Class = require 'libs/class'
require 'libs/Animation'
require 'src/movement'

function initSprites()
    sprites = {}
    sprites[1] = {image = love.graphics.newImage("sprites/face_stand.png")}
    sprites[2] = {image = love.graphics.newImage("sprites/face_walk.png")}
    sprites[3] = {image = love.graphics.newImage("sprites/back_stand.png")}
    sprites[4] = {image = love.graphics.newImage("sprites/back_walk.png")}
    sprites[5] = {image = love.graphics.newImage("sprites/left_stand.png")}
    sprites[6] = {image = love.graphics.newImage("sprites/left_walk.png")}
    sprites[7] = {image = love.graphics.newImage("sprites/right_stand.png")}
    sprites[8] = {image = love.graphics.newImage("sprites/right_walk.png")}
    sprites[9] = {image = love.graphics.newImage("sprites/grass.png")}
end

function initSounds()
    sounds = {}
    sounds['music'] = love.audio.newSource("sounds/music.mp3", "static")
end

function setupWindow()
    WINDOW_WIDTH = 719
    WINDOW_HEIGHT = 494
    VIRTUAL_WIDTH = 300
    VIRTUAL_HEIGHT = 200

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        vsync = true,
        resizable = false
    })

    love.graphics.setDefaultFilter("nearest", "nearest")
end

function drawBackground()
    background = sprites[9].image 
    rsz = 2.8

    love.graphics.setColor(0, 1, 1)
    for i = 0, WINDOW_WIDTH / background:getWidth() do
        for j = 0, WINDOW_HEIGHT / background:getHeight() do
          love.graphics.draw(background, i * background:getWidth()*rsz, j * background:getHeight()*rsz, 0, rsz, rsz)
        end
    end
    love.graphics.setColor(255, 255, 255, 255)
end

function displayFPS()
    love.graphics.setColor(1, 1, 0)
    love.graphics.print('FPS: ' .. tostring(love.timer.getFPS()), 10, 10, 0, 2, 2)
    love.graphics.setColor(255, 255, 255, 255)
end

-- better dont
function love.resize(w, h)
    push:resize(w, h)
    WINDOW_WIDTH = w
    WINDOW_HEIGHT = h
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end