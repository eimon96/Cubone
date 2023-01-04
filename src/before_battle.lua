function checkEnemy()
    local rand = math.random(0,196)
    if rand < 3 then
        e = pickEnemy()
        pkmn = true
    end
end

function changeMusic()
    sounds['music']:stop()
    sounds['battle']:setLooping(true)
    sounds['battle']:play()
end

function pickEnemy()
    math.randomseed(os.time())
    math.random(1,9); math.random(1,9); math.random(1,9)
    
    return math.random(1,9)
end