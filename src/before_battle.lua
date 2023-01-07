function checkEnemy()
    local rand = math.random(0,196)
    if rand < 3 then
        e = pickEnemy()
        pkmn = true
        changeMusic()
        changeThings()
    end
end

function changeMusic()
    sounds['music']:stop()
    sounds['battle']:setLooping(false)
    sounds['battle']:play()
end

function pickEnemy()
    math.randomseed(os.time())
    math.random(1,9); math.random(1,9); math.random(1,9)

    return math.random(1,9)
end

function changeThings()
    state = 'battle'
    i = WINDOW_WIDTH
    e_h = 5
    r = 0
    tackle = false
    bone = false
    run = false
    dead = false
    pose = sprites[10]
    play_growl = true
    wait = 7*60
    enemies[e].health = 250 

    bone_x = sprites[10]:getWidth() - 20
    bone_y = WINDOW_HEIGHT - sprites[10]:getHeight()
    bone_r = 0
end