push = require 'push'
Class = require 'class'
require 'Animation'

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

function love.load()
    initSprites()
    setupWindow()

    cubone = sprites[1].image
    speed = 120
    x = VIRTUAL_WIDTH
    y = VIRTUAL_HEIGHT / 2
    anime = Animation {
        frames = {cubone},
        interval = 0.2
    }
end
 
function love.draw()
    love.graphics.draw(anime:getCurrentFrame(), x, y, 0, 2, 2) 
    displayFPS()
end

function walkUp(dt)
    if y > 0 then
        y = y - speed*dt
    end
    anime:update(dt)
    anime.frames = {sprites[4].image, sprites[3].image}
end

function walkDown(dt)
    if y < WINDOW_HEIGHT - 90 then 
        y = y + speed*dt
    end
    anime:update(dt)
    anime.frames = {sprites[2].image, sprites[1].image}
end

function walkLeft(dt)
    if x > 0 then
        x = x - speed*dt
    end
    anime:update(dt)
    anime.frames = {sprites[6].image, sprites[5].image}
end

function walkRight(dt)
    if x < WINDOW_WIDTH - 80  then
        x = x + speed*dt
    end
    anime:update(dt)
    anime.frames = {sprites[8].image, sprites[7].image}
end

function love.update(dt)
    if love.keyboard.isDown('w', 'up') then
        walkUp(dt)
    elseif love.keyboard.isDown('a', 'left') then
        walkLeft(dt)
    elseif love.keyboard.isDown('d', 'right') then
        walkRight(dt)
    elseif love.keyboard.isDown('s', 'down') then
        walkDown(dt)
    end
end