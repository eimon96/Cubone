push = require 'push'

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
    x = VIRTUAL_WIDTH
    y = VIRTUAL_HEIGHT / 2
end
 
function love.draw()
    love.graphics.draw(cubone, x, y, 0, 2.5, 2.5)
    displayFPS()
end

function walkUp(dt)
    cubone = sprites[4].image
    cubone = sprites[3].image
    if y > 0 then
        y = y - 120*dt
    end
end

function walkDown(dt)
    cubone = sprites[2].image
    cubone = sprites[1].image
    if y < WINDOW_HEIGHT - 90 then 
        y = y + 120*dt
    end
end

function walkLeft(dt)
    cubone = sprites[6].image
    cubone = sprites[5].image
    if x > 0 then
        x = x - 120*dt
    end
end

function walkRight(dt)
    cubone = sprites[8].image
    cubone = sprites[7].image
    if x < WINDOW_WIDTH - 80  then
        x = x + 120*dt
    end
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