function checkEnemy()
    rand = math.random(0,196)
    if rand < 3 then
        pkmn = true
    end
end

function changeMusic()
    sounds['music']:stop()
    sounds['battle']:setLooping(true)
    sounds['battle']:play()
end