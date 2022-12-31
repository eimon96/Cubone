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