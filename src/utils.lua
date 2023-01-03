push = require 'libs/push'
Class = require 'libs/class'
require 'libs/Animation'
require 'src/movement'
require 'src/before_battle'
require 'src/battle'

function initSprites()
    -- https://www.pokencyclopedia.info/en/index.php?id=sprites/104
    
    sprites = {}
    sprites[1] = love.graphics.newImage("sprites/face_stand.png")
    sprites[2] = love.graphics.newImage("sprites/face_walk.png")
    sprites[3] = love.graphics.newImage("sprites/back_stand.png")
    sprites[4] = love.graphics.newImage("sprites/back_walk.png")
    sprites[5] = love.graphics.newImage("sprites/left_stand.png")
    sprites[6] = love.graphics.newImage("sprites/left_walk.png")
    sprites[7] = love.graphics.newImage("sprites/right_stand.png")
    sprites[8] = love.graphics.newImage("sprites/right_walk.png")
    sprites[9] = love.graphics.newImage("sprites/grass.png")
    sprites[90] = love.graphics.newImage("sprites/no_grass.png")
    sprites[91] = love.graphics.newImage("sprites/battlefield.jpg")
    sprites[10] = love.graphics.newImage("sprites/cubone_battle.png")
end

function initSounds()
    sounds = {}
    sounds['music'] = love.audio.newSource("sounds/music.mp3", "static")
    sounds['music']:setVolume(0.7)
    sounds['battle'] = love.audio.newSource("sounds/battle.mp3", "static")
    sounds['battle']:setVolume(0.7)
    sounds['hit'] = love.audio.newSource("sounds/hit.wav", "static")
    sounds['hit']:setVolume(0.3)
end

function setupWindow()
    WINDOW_WIDTH = 719
    WINDOW_HEIGHT = 448
    VIRTUAL_WIDTH = 300
    VIRTUAL_HEIGHT = 200

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        vsync = true,
        resizable = false
    })

    love.window.setTitle('Cubone')
    love.graphics.setDefaultFilter("nearest", "nearest")
end

function drawBackground()
    grass = sprites[9]
    no_grass = sprites[90] 
    rsz = 2.8

    love.graphics.setColor(0, 1, 1)
    for i = 0, WINDOW_WIDTH / grass:getWidth() do
        for j = 0, WINDOW_HEIGHT / grass:getHeight() do
            if (i + j) % 2 == 0 or (i + j) % 3 == 0 then
                love.graphics.draw(grass, i * grass:getWidth()*rsz, j * grass:getHeight()*rsz, 0, rsz, rsz)
            else
                love.graphics.draw(no_grass, i * grass:getWidth()*rsz, j * grass:getHeight()*rsz, 0, rsz, rsz)
            end
        end
    end
    love.graphics.setColor(1, 1, 1, 1)
end

function displayFPS()
    love.graphics.setColor(1, 1, 0)
    love.graphics.print('FPS: ' .. tostring(love.timer.getFPS()), 10, 10, 0, 1.5, 1.5)
    love.graphics.setColor(1, 1, 1, 1)
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