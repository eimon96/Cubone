function walkUp(dt)
    if y > 0 then
        y = y - speed*dt
    end
    anime:update(dt)
    anime.frames = {sprites[4], sprites[3]}
end

function walkDown(dt)
    if y < WINDOW_HEIGHT - 90 then 
        y = y + speed*dt
    end
    anime:update(dt)
    anime.frames = {sprites[2], sprites[1]}
end

function walkLeft(dt)
    if x > 0 then
        x = x - speed*dt
    end
    anime:update(dt)
    anime.frames = {sprites[6], sprites[5]}
end

function walkRight(dt)
    if x < WINDOW_WIDTH - 80  then
        x = x + speed*dt
    end
    anime:update(dt)
    anime.frames = {sprites[8], sprites[7]}
end