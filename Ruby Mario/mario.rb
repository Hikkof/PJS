require 'ruby2d'
require 'csv'


SCALE = 3
WALK_SPEED = 2
BLOCK_WIDTH = 16

set width: 30*BLOCK_WIDTH*SCALE
set height: 15*BLOCK_WIDTH*SCALE

background = Image.new('map.png')
background_x = 0
foreground = CSV.read("mapwbg.csv")

mario = Sprite.new(
    'mario.png',
    width: BLOCK_WIDTH*SCALE,
    height: BLOCK_WIDTH*SCALE,
    clip_width: BLOCK_WIDTH,
    y: 12*BLOCK_WIDTH*SCALE,
    time: 250,
    animations: {
        idle: 0..0,
        walk: 1..3,
        jump: 4..4,
        die: 5..5
    }
)

mario_xv = 0
mario_yv = 0
mario_dead = false

update do
    if !mario_dead
        on :key_held  do |event|
            case event.key
                when 'left'
                    if mario_yv == 0
                        mario.play animation: :walk, flip: :horizontal
                    end
                    mario_xv = WALK_SPEED*SCALE*(-1)
                when 'right'
                    if mario_yv == 0
                        mario.play animation: :walk
                    end
                    mario_xv = WALK_SPEED*SCALE
                when 'up'
                    if mario_xv >= 0
                        mario.play animation: :jump
                    else
                        mario.play animation: :jump, flip: :horizontal
                    end
            end
        end

        on :key_down  do |event|
            case event.key
                when 'space'
                    if mario_yv == 0
                        mario_yv = 3*WALK_SPEED*SCALE*(-1)
                    end
                when 'c'  # tylko do testów
                    mario.play animation: :die
                    mario_dead = true
            end
        end


        on :key_up do |event|
            case event.key
                when 'left'
                    if mario_xv == 0 and mario_yv == 0
                        mario.play animation: :idle, flip: :horizontal
                    end
                when 'right'
                    if mario_xv == 0 and mario_yv == 0
                        mario.play animation: :idle
                    end
            end
        end

        if mario_yv != 0
            if mario_xv >= 0
                mario.play animation: :jump
            else
                mario.play animation: :jump, flip: :horizontal
            end
        end

        tx = mario.x + mario_xv
        ty = mario.y + mario_yv
        mario_yv += 0.125*WALK_SPEED*SCALE

        if tx > (Window.width - mario.width)
            mario.x = Window.width - mario.width
        end
        if tx < 0
            mario.x = 0
        else
            mario.x += mario_xv
        end

        y = 0
        while y < 15
            x = 0
            while x < 209
                if foreground[y][x] != '-1'
                    if mario.contains? x*BLOCK_WIDTH*SCALE+1+background.x, y*BLOCK_WIDTH*SCALE+1 or mario.contains? (x+1)*BLOCK_WIDTH*SCALE+1+background.x, y*BLOCK_WIDTH*SCALE+1 or mario.contains? x*BLOCK_WIDTH*SCALE+1+background.x, (y+1)*BLOCK_WIDTH*SCALE+1  or mario.contains? (x+1)*BLOCK_WIDTH*SCALE+1+background.x, (y+1)*BLOCK_WIDTH*SCALE+1
                        mario.x -= mario_xv
                    end
                end
                x += 1
            end
            y += 1
        end
        mario_xv = 0
        puts mario.x

        if mario.x > Window.width/2 + background_x
            background_x += Window.width/2 - mario.x
            background.x += Window.width/2 - mario.x
            mario.x = Window.width/2
        end

        if ty < 0
            mario.y = 0
        else
            mario.y += mario_yv
        end

        y = 0
        while y < 15
            x = 0
            while x < 209
                if foreground[y][x] != '-1'
                    if mario.contains? x*BLOCK_WIDTH*SCALE+1+background.x, y*BLOCK_WIDTH*SCALE+1 or mario.contains? (x+1)*BLOCK_WIDTH*SCALE+1+background.x, y*BLOCK_WIDTH*SCALE+1 or mario.contains? x*BLOCK_WIDTH*SCALE+1+background.x, (y+1)*BLOCK_WIDTH*SCALE+1  or mario.contains? (x+1)*BLOCK_WIDTH*SCALE+1+background.x, (y+1)*BLOCK_WIDTH*SCALE+1
                        mario.y -= mario_yv
                        mario_yv = 0
                    end
                end
                x += 1
            end
            y += 1
        end

        if mario_yv > 2*WALK_SPEED*SCALE
            mario_yv = 2*WALK_SPEED*SCALE
        end

        if mario.y + mario.height >= Window.height
            mario_dead = true
        end
    else
        mario.play animation: :die
    end
end
show