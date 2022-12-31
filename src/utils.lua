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
end

function initSounds()
    sounds = {}
    sounds['music'] = love.audio.newSource("sounds/music.mp3", "static")
end

function setupWindow()
    WINDOW_WIDTH = 700
    WINDOW_HEIGHT = 500
    VIRTUAL_WIDTH = 300
    VIRTUAL_HEIGHT = 200

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        vsync = true,
        resizable = false
    })

    love.graphics.setDefaultFilter("nearest", "nearest")
end

function displayFPS()
    love.graphics.setColor(0, 255/255, 0, 255/255)
    love.graphics.print('FPS: ' .. tostring(love.timer.getFPS()), 10, 10)
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