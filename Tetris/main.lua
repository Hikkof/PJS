_G.love = require('love')


--[[
1 - x x
    x m
2 - x x m x
3 - x m x
      x
4 - x m x
        x
5 -     x
    x m x
]]


function createShape()
    if _G.current_block == 1 then
        _G.block_table[_G.current_middle_x][_G.current_middle_y] = 1
        _G.block_table[_G.current_middle_x][_G.current_middle_y-1] = 1
        _G.block_table[_G.current_middle_x-1][_G.current_middle_y-1] = 1
        _G.block_table[_G.current_middle_x-1][_G.current_middle_y] = 1
    elseif _G.current_block == 2 then
        if _G.current_rotation == 0 or _G.current_rotation == 2 then
            _G.block_table[_G.current_middle_x+1][_G.current_middle_y] = 1
            _G.block_table[_G.current_middle_x][_G.current_middle_y] = 1
            _G.block_table[_G.current_middle_x-1][_G.current_middle_y] = 1
            _G.block_table[_G.current_middle_x-2][_G.current_middle_y] = 1
        else
            _G.block_table[_G.current_middle_x][_G.current_middle_y-1] = 1
            _G.block_table[_G.current_middle_x][_G.current_middle_y] = 1
            _G.block_table[_G.current_middle_x][_G.current_middle_y+1] = 1
            _G.block_table[_G.current_middle_x][_G.current_middle_y+2] = 1
        end
    elseif _G.current_block == 3 then
        if _G.current_rotation == 0 then
            _G.block_table[_G.current_middle_x+1][_G.current_middle_y] = 1
            _G.block_table[_G.current_middle_x][_G.current_middle_y] = 1
            _G.block_table[_G.current_middle_x-1][_G.current_middle_y] = 1
            _G.block_table[_G.current_middle_x][_G.current_middle_y+1] = 1
        elseif _G.current_rotation == 1 then
            _G.block_table[_G.current_middle_x][_G.current_middle_y-1] = 1
            _G.block_table[_G.current_middle_x][_G.current_middle_y] = 1
            _G.block_table[_G.current_middle_x][_G.current_middle_y+1] = 1
            _G.block_table[_G.current_middle_x-1][_G.current_middle_y] = 1
        elseif _G.current_rotation == 2 then
            _G.block_table[_G.current_middle_x+1][_G.current_middle_y] = 1
            _G.block_table[_G.current_middle_x][_G.current_middle_y] = 1
            _G.block_table[_G.current_middle_x-1][_G.current_middle_y] = 1
            _G.block_table[_G.current_middle_x][_G.current_middle_y-1] = 1
        else
            _G.block_table[_G.current_middle_x][_G.current_middle_y-1] = 1
            _G.block_table[_G.current_middle_x][_G.current_middle_y] = 1
            _G.block_table[_G.current_middle_x][_G.current_middle_y+1] = 1
            _G.block_table[_G.current_middle_x+1][_G.current_middle_y] = 1
        end
    elseif _G.current_block == 4 then
        if _G.current_rotation == 0 then
            _G.block_table[_G.current_middle_x+1][_G.current_middle_y] = 1
            _G.block_table[_G.current_middle_x][_G.current_middle_y] = 1
            _G.block_table[_G.current_middle_x-1][_G.current_middle_y] = 1
            _G.block_table[_G.current_middle_x+1][_G.current_middle_y+1] = 1
        elseif _G.current_rotation == 1 then
            _G.block_table[_G.current_middle_x][_G.current_middle_y-1] = 1
            _G.block_table[_G.current_middle_x][_G.current_middle_y] = 1
            _G.block_table[_G.current_middle_x][_G.current_middle_y+1] = 1
            _G.block_table[_G.current_middle_x-1][_G.current_middle_y+1] = 1
        elseif _G.current_rotation == 2 then
            _G.block_table[_G.current_middle_x+1][_G.current_middle_y] = 1
            _G.block_table[_G.current_middle_x][_G.current_middle_y] = 1
            _G.block_table[_G.current_middle_x-1][_G.current_middle_y] = 1
            _G.block_table[_G.current_middle_x-1][_G.current_middle_y-1] = 1
        else
            _G.block_table[_G.current_middle_x][_G.current_middle_y-1] = 1
            _G.block_table[_G.current_middle_x][_G.current_middle_y] = 1
            _G.block_table[_G.current_middle_x][_G.current_middle_y+1] = 1
            _G.block_table[_G.current_middle_x+1][_G.current_middle_y-1] = 1
        end
    else
        if _G.current_rotation == 0 then
            _G.block_table[_G.current_middle_x+1][_G.current_middle_y] = 1
            _G.block_table[_G.current_middle_x][_G.current_middle_y] = 1
            _G.block_table[_G.current_middle_x-1][_G.current_middle_y] = 1
            _G.block_table[_G.current_middle_x-1][_G.current_middle_y+1] = 1
        elseif _G.current_rotation == 1 then
            _G.block_table[_G.current_middle_x][_G.current_middle_y-1] = 1
            _G.block_table[_G.current_middle_x][_G.current_middle_y] = 1
            _G.block_table[_G.current_middle_x][_G.current_middle_y+1] = 1
            _G.block_table[_G.current_middle_x-1][_G.current_middle_y-1] = 1
        elseif _G.current_rotation == 2 then
            _G.block_table[_G.current_middle_x+1][_G.current_middle_y] = 1
            _G.block_table[_G.current_middle_x][_G.current_middle_y] = 1
            _G.block_table[_G.current_middle_x-1][_G.current_middle_y] = 1
            _G.block_table[_G.current_middle_x+1][_G.current_middle_y-1] = 1
        else
            _G.block_table[_G.current_middle_x][_G.current_middle_y-1] = 1
            _G.block_table[_G.current_middle_x][_G.current_middle_y] = 1
            _G.block_table[_G.current_middle_x][_G.current_middle_y+1] = 1
            _G.block_table[_G.current_middle_x+1][_G.current_middle_y+1] = 1
        end
    end
end


function fall()
    turn = false
    if _G.current_block == 1 then
        if _G.current_middle_y+1 > 20 or _G.block_table[_G.current_middle_x][_G.current_middle_y+1] == 0
        or _G.block_table[_G.current_middle_x-1][_G.current_middle_y+1] == 0 then
            turn = true
        end
    elseif _G.current_block == 2 then
        if _G.current_rotation == 1 or _G.current_rotation == 3 then
            if _G.current_middle_y+3 > 20 or _G.block_table[_G.current_middle_x][_G.current_middle_y+3] == 0 then
                turn = true
            end
        else
            if _G.current_middle_y+1 > 20 or _G.block_table[_G.current_middle_x-2][_G.current_middle_y+1] == 0
            or _G.block_table[_G.current_middle_x-1][_G.current_middle_y+1] == 0
            or _G.block_table[_G.current_middle_x][_G.current_middle_y+1] == 0
            or _G.block_table[_G.current_middle_x+1][_G.current_middle_y+1] == 0 then
                turn = true
            end
        end
    elseif _G.current_block == 3 then
        if _G.current_rotation == 0 then
            if _G.current_middle_y+2 > 20 or _G.block_table[_G.current_middle_x-1][_G.current_middle_y+1] == 0
            or _G.block_table[_G.current_middle_x][_G.current_middle_y+2] == 0
            or _G.block_table[_G.current_middle_x+1][_G.current_middle_y+1] == 0 then
                turn = true
            end
        elseif _G.current_rotation == 1 then
            if _G.current_middle_y+2 > 20 or _G.block_table[_G.current_middle_x-1][_G.current_middle_y+1] == 0
            or _G.block_table[_G.current_middle_x][_G.current_middle_y+2] == 0 then
                turn = true
            end
        elseif _G.current_rotation == 2 then
            if _G.current_middle_y+1 > 20 or _G.block_table[_G.current_middle_x-1][_G.current_middle_y+1] == 0
            or _G.block_table[_G.current_middle_x][_G.current_middle_y+1] == 0
            or _G.block_table[_G.current_middle_x+1][_G.current_middle_y+1] == 0 then
                turn = true
            end
        else
            if _G.current_middle_y+2 > 20 or _G.block_table[_G.current_middle_x][_G.current_middle_y+2] == 0
            or _G.block_table[_G.current_middle_x+1][_G.current_middle_y+1] == 0 then
                turn = true
            end
        end
    elseif _G.current_block == 4 then
        if _G.current_rotation == 0 then
            if _G.current_middle_y+2 > 20 or _G.block_table[_G.current_middle_x-1][_G.current_middle_y+1] == 0
            or _G.block_table[_G.current_middle_x][_G.current_middle_y+1] == 0
            or _G.block_table[_G.current_middle_x+1][_G.current_middle_y+2] == 0 then
                turn = true
            end
        elseif _G.current_rotation == 1 then
            if _G.current_middle_y+2 > 20 or _G.block_table[_G.current_middle_x-1][_G.current_middle_y+2] == 0
            or _G.block_table[_G.current_middle_x][_G.current_middle_y+2] == 0 then
                turn = true
            end
        elseif _G.current_rotation == 2 then
            if _G.current_middle_y+1 > 20 or _G.block_table[_G.current_middle_x-1][_G.current_middle_y+1] == 0
            or _G.block_table[_G.current_middle_x][_G.current_middle_y+1] == 0
            or _G.block_table[_G.current_middle_x+1][_G.current_middle_y+1] == 0 then
                turn = true
            end
        else
            if _G.current_middle_y+2 > 20 or _G.block_table[_G.current_middle_x][_G.current_middle_y+2] == 0
            or _G.block_table[_G.current_middle_x+1][_G.current_middle_y] == 0 then
                turn = true
            end
        end
    else
        if _G.current_rotation == 0 then
            if _G.current_middle_y+2 > 20 or _G.block_table[_G.current_middle_x-1][_G.current_middle_y+2] == 0
            or _G.block_table[_G.current_middle_x][_G.current_middle_y+1] == 0
            or _G.block_table[_G.current_middle_x+1][_G.current_middle_y+1] == 0 then
                turn = true
            end
        elseif _G.current_rotation == 1 then
            if _G.current_middle_y+2 > 20 or _G.block_table[_G.current_middle_x-1][_G.current_middle_y] == 0
            or _G.block_table[_G.current_middle_x][_G.current_middle_y+2] == 0 then
                turn = true
            end
        elseif _G.current_rotation == 2 then
            if _G.current_middle_y+1 > 20 or _G.block_table[_G.current_middle_x-1][_G.current_middle_y+1] == 0
            or _G.block_table[_G.current_middle_x][_G.current_middle_y+1] == 0
            or _G.block_table[_G.current_middle_x+1][_G.current_middle_y+1] == 0 then
                turn = true
            end
        else
            if _G.current_middle_y+2 > 20 or _G.block_table[_G.current_middle_x][_G.current_middle_y+2] == 0
            or _G.block_table[_G.current_middle_x+1][_G.current_middle_y+2] == 0 then
                turn = true
            end
        end
    end

    if turn then
        turnStatic()
    else
        _G.current_middle_y = _G.current_middle_y+1
    end
end


function colapse(y)
    for j = y, 2, -1 do
        for i = 1, 10 do
            _G.block_table[i][j] = _G.block_table[i][j-1]
        end
    end
end


function checkState()
    for i = 1, 10 do
        for j = 1, 2 do
            if _G.block_table[i][j] == 0 then
                gameOver()
            end
        end
    end

    for j = 3, 20 do
        destroy = true
        for i = 1, 10 do
            if _G.block_table[i][j] ~= 0 then
                destroy = false
            end
        end
        if destroy == true then
            colapse(j)
        end
    end
end


function turnStatic()
    for i = 1, 10 do
        for j = 1, 20 do
            if _G.block_table[i][j] == 1 then
                _G.block_table[i][j] = 0
            end
        end
    end

    checkState()

    _G.current_block = _G.next_block
    _G.next_block = math.random(5)
    _G.current_middle_x = 6
    _G.current_middle_y = 2
    _G.current_rotation = 0
end


function move(direction)
    if _G.current_block == 1 then
        if _G.current_middle_x+direction < 11 and _G.current_middle_x+direction > 1 then
            if direction == 1 then
                if _G.block_table[_G.current_middle_x+1][_G.current_middle_y-1] == -1
                and _G.block_table[_G.current_middle_x+1][_G.current_middle_y] == -1 then
                    _G.current_middle_x = _G.current_middle_x+direction
                end
            else
                if _G.block_table[_G.current_middle_x-2][_G.current_middle_y-1] == -1
                and _G.block_table[_G.current_middle_x-2][_G.current_middle_y] == -1 then
                    _G.current_middle_x = _G.current_middle_x+direction
                end
            end
        end
    elseif _G.current_block == 2 then
        if _G.current_rotation == 0 or _G.current_rotation == 2 then
            if _G.current_middle_x+direction < 10 and _G.current_middle_x+direction > 2 then
                if direction == 1 then
                    if _G.block_table[_G.current_middle_x+2][_G.current_middle_y] == -1 then
                        _G.current_middle_x = _G.current_middle_x+direction
                    end
                else
                    if _G.block_table[_G.current_middle_x-3][_G.current_middle_y] == -1 then
                        _G.current_middle_x = _G.current_middle_x+direction
                    end
                end
            end
        else
            if _G.current_middle_x+direction < 11 and _G.current_middle_x+direction > 0 then
                if direction == 1 then
                    if _G.block_table[_G.current_middle_x+1][_G.current_middle_y-1] == -1
                    and _G.block_table[_G.current_middle_x+1][_G.current_middle_y] == -1
                    and _G.block_table[_G.current_middle_x+1][_G.current_middle_y+1] == -1
                    and _G.block_table[_G.current_middle_x+1][_G.current_middle_y+2] == -1 then
                        _G.current_middle_x = _G.current_middle_x+direction
                    end
                else
                    if _G.block_table[_G.current_middle_x-1][_G.current_middle_y-1] == -1
                    and _G.block_table[_G.current_middle_x-1][_G.current_middle_y] == -1
                    and _G.block_table[_G.current_middle_x-1][_G.current_middle_y+1] == -1
                    and _G.block_table[_G.current_middle_x-1][_G.current_middle_y+2] == -1 then
                        _G.current_middle_x = _G.current_middle_x+direction
                    end
                end
            end
        end
    elseif _G.current_block == 3 then
        if _G.current_rotation == 0 then
            if _G.current_middle_x+direction < 10 and _G.current_middle_x+direction > 1 then
                if direction == 1 then
                    if _G.block_table[_G.current_middle_x+2][_G.current_middle_y] == -1
                    and _G.block_table[_G.current_middle_x+1][_G.current_middle_y+1] == -1 then
                        _G.current_middle_x = _G.current_middle_x+direction
                    end
                else
                    if _G.block_table[_G.current_middle_x-2][_G.current_middle_y] == -1
                    and _G.block_table[_G.current_middle_x-1][_G.current_middle_y+1] == -1 then
                        _G.current_middle_x = _G.current_middle_x+direction
                    end
                end
            end
        elseif _G.current_rotation == 1 then
            if _G.current_middle_x+direction < 11 and _G.current_middle_x+direction > 1 then
                if direction == 1 then
                    if _G.block_table[_G.current_middle_x+1][_G.current_middle_y-1] == -1
                    and _G.block_table[_G.current_middle_x+1][_G.current_middle_y] == -1
                    and _G.block_table[_G.current_middle_x+1][_G.current_middle_y+1] == -1 then
                        _G.current_middle_x = _G.current_middle_x+direction
                    end
                else
                    if _G.block_table[_G.current_middle_x-1][_G.current_middle_y-1] == -1
                    and _G.block_table[_G.current_middle_x-2][_G.current_middle_y] == -1
                    and _G.block_table[_G.current_middle_x-1][_G.current_middle_y+1] == -1 then
                        _G.current_middle_x = _G.current_middle_x+direction
                    end
                end
            end
        elseif _G.current_rotation == 2 then
            if _G.current_middle_x+direction < 11 and _G.current_middle_x+direction > 1 then
                if direction == 1 then
                    if _G.block_table[_G.current_middle_x+1][_G.current_middle_y-1] == -1
                    and _G.block_table[_G.current_middle_x+2][_G.current_middle_y] == -1 then
                        _G.current_middle_x = _G.current_middle_x+direction
                    end
                else
                    if _G.block_table[_G.current_middle_x-1][_G.current_middle_y-1] == -1
                    and _G.block_table[_G.current_middle_x-2][_G.current_middle_y] == -1 then
                        _G.current_middle_x = _G.current_middle_x+direction
                    end
                end
            end
        else
            if _G.current_middle_x+direction < 10 and _G.current_middle_x+direction > 0 then
                if direction == 1 then
                    if _G.block_table[_G.current_middle_x+1][_G.current_middle_y-1] == -1
                    and _G.block_table[_G.current_middle_x+2][_G.current_middle_y] == -1
                    and _G.block_table[_G.current_middle_x+1][_G.current_middle_y+1] == -1 then
                        _G.current_middle_x = _G.current_middle_x+direction
                    end
                else
                    if _G.block_table[_G.current_middle_x-1][_G.current_middle_y-1] == -1
                    and _G.block_table[_G.current_middle_x-1][_G.current_middle_y] == -1
                    and _G.block_table[_G.current_middle_x-1][_G.current_middle_y+1] == -1 then
                        _G.current_middle_x = _G.current_middle_x+direction
                    end
                end
            end
        end
    elseif _G.current_block == 4 then
        if _G.current_rotation == 0 then
            if _G.current_middle_x+direction < 10 and _G.current_middle_x+direction > 1 then
                if direction == 1 then
                    if _G.block_table[_G.current_middle_x+2][_G.current_middle_y] == -1
                    and _G.block_table[_G.current_middle_x+2][_G.current_middle_y+1] == -1 then
                        _G.current_middle_x = _G.current_middle_x+direction
                    end
                else
                    if _G.block_table[_G.current_middle_x-2][_G.current_middle_y] == -1
                    and _G.block_table[_G.current_middle_x][_G.current_middle_y+1] == -1 then
                        _G.current_middle_x = _G.current_middle_x+direction
                    end
                end
            end
        elseif _G.current_rotation == 1 then
            if _G.current_middle_x+direction < 11 and _G.current_middle_x+direction > 1 then
                if direction == 1 then
                    if _G.block_table[_G.current_middle_x+1][_G.current_middle_y-1] == -1
                    and _G.block_table[_G.current_middle_x+1][_G.current_middle_y] == -1
                    and _G.block_table[_G.current_middle_x+1][_G.current_middle_y+1] == -1 then
                        _G.current_middle_x = _G.current_middle_x+direction
                    end
                else
                    if _G.block_table[_G.current_middle_x-1][_G.current_middle_y-1] == -1
                    and _G.block_table[_G.current_middle_x-1][_G.current_middle_y] == -1
                    and _G.block_table[_G.current_middle_x-2][_G.current_middle_y+1] == -1 then
                        _G.current_middle_x = _G.current_middle_x+direction
                    end
                end
            end
        elseif _G.current_rotation == 2 then
            if _G.current_middle_x+direction < 10 and _G.current_middle_x+direction > 1 then
                if direction == 1 then
                    if _G.block_table[_G.current_middle_x][_G.current_middle_y-1] == -1
                    and _G.block_table[_G.current_middle_x+2][_G.current_middle_y] == -1 then
                        _G.current_middle_x = _G.current_middle_x+direction
                    end
                else
                    if _G.block_table[_G.current_middle_x-2][_G.current_middle_y-1] == -1
                    and _G.block_table[_G.current_middle_x-2][_G.current_middle_y] == -1 then
                        _G.current_middle_x = _G.current_middle_x+direction
                    end
                end
            end
        else
            if _G.current_middle_x+direction < 10 and _G.current_middle_x+direction > 0 then
                if direction == 1 then
                    if _G.block_table[_G.current_middle_x+2][_G.current_middle_y-1] == -1
                    and _G.block_table[_G.current_middle_x+1][_G.current_middle_y] == -1
                    and _G.block_table[_G.current_middle_x+1][_G.current_middle_y+1] == -1 then
                        _G.current_middle_x = _G.current_middle_x+direction
                    end
                else
                    if _G.block_table[_G.current_middle_x-1][_G.current_middle_y-1] == -1
                    and _G.block_table[_G.current_middle_x-1][_G.current_middle_y] == -1
                    and _G.block_table[_G.current_middle_x-1][_G.current_middle_y+1] == -1 then
                        _G.current_middle_x = _G.current_middle_x+direction
                    end
                end
            end
        end
    else
        if _G.current_rotation == 0 then
            if _G.current_middle_x+direction < 10 and _G.current_middle_x+direction > 1 then
                if direction == 1 then
                    if _G.block_table[_G.current_middle_x+2][_G.current_middle_y] == -1
                    and _G.block_table[_G.current_middle_x][_G.current_middle_y+1] == -1 then
                        _G.current_middle_x = _G.current_middle_x+direction
                    end
                else
                    if _G.block_table[_G.current_middle_x-2][_G.current_middle_y] == -1
                    and _G.block_table[_G.current_middle_x-2][_G.current_middle_y+1] == -1 then
                        _G.current_middle_x = _G.current_middle_x+direction
                    end
                end
            end
        elseif _G.current_rotation == 1 then
            if _G.current_middle_x+direction < 11 and _G.current_middle_x+direction > 1 then
                if direction == 1 then
                    if _G.block_table[_G.current_middle_x+1][_G.current_middle_y-1] == -1
                    and _G.block_table[_G.current_middle_x+1][_G.current_middle_y] == -1
                    and _G.block_table[_G.current_middle_x+1][_G.current_middle_y+1] == -1 then
                        _G.current_middle_x = _G.current_middle_x+direction
                    end
                else
                    if _G.block_table[_G.current_middle_x-2][_G.current_middle_y-1] == -1
                    and _G.block_table[_G.current_middle_x-1][_G.current_middle_y] == -1
                    and _G.block_table[_G.current_middle_x-1][_G.current_middle_y+1] == -1 then
                        _G.current_middle_x = _G.current_middle_x+direction
                    end
                end
            end
        elseif _G.current_rotation == 2 then
            if _G.current_middle_x+direction < 10 and _G.current_middle_x+direction > 1 then
                if direction == 1 then
                    if _G.block_table[_G.current_middle_x+2][_G.current_middle_y-1] == -1
                    and _G.block_table[_G.current_middle_x+2][_G.current_middle_y] == -1 then
                        _G.current_middle_x = _G.current_middle_x+direction
                    end
                else
                    if _G.block_table[_G.current_middle_x][_G.current_middle_y-1] == -1
                    and _G.block_table[_G.current_middle_x-2][_G.current_middle_y] == -1 then
                        _G.current_middle_x = _G.current_middle_x+direction
                    end
                end
            end
        else
            if _G.current_middle_x+direction < 10 and _G.current_middle_x+direction > 0 then
                if direction == 1 then
                    if _G.block_table[_G.current_middle_x+1][_G.current_middle_y-1] == -1
                    and _G.block_table[_G.current_middle_x+1][_G.current_middle_y] == -1
                    and _G.block_table[_G.current_middle_x+2][_G.current_middle_y+1] == -1 then
                        _G.current_middle_x = _G.current_middle_x+direction
                    end
                else
                    if _G.block_table[_G.current_middle_x-1][_G.current_middle_y-1] == -1
                    and _G.block_table[_G.current_middle_x-1][_G.current_middle_y] == -1
                    and _G.block_table[_G.current_middle_x-1][_G.current_middle_y+1] == -1 then
                        _G.current_middle_x = _G.current_middle_x+direction
                    end
                end
            end
        end
    end
end


function rotate()
    rotatable = true
    if _G.current_block == 2 then
        if _G.current_rotation == 0 or _G.current_rotation == 2 then
            if _G.current_middle_y+2 > 20 or _G.block_table[_G.current_middle_x][_G.current_middle_y+1] == 0
            or _G.block_table[_G.current_middle_x][_G.current_middle_y+2] == 0 then
                rotatable = false
            end
        else
            if (_G.current_middle_x+1 > 10 and _G.current_middle_x-2 < 1) or _G.block_table[_G.current_middle_x-2][_G.current_middle_y] == 0
            or _G.block_table[_G.current_middle_x-1][_G.current_middle_y] == 0
            or _G.block_table[_G.current_middle_x+1][_G.current_middle_y] == 0 then
                rotatable = false
            end
        end
    elseif _G.current_block == 3 then
        if _G.current_rotation == 0 then
            if _G.block_table[_G.current_middle_x][_G.current_middle_y-1] == 0 then
                rotatable = false
            end
        elseif _G.current_rotation == 1 then
            if _G.current_middle_x+1 > 10 or _G.block_table[_G.current_middle_x+1][_G.current_middle_y] == 0 then
                rotatable = false
            end
        elseif _G.current_rotation == 2 then
            if _G.current_middle_y+1 > 20 or _G.block_table[_G.current_middle_x][_G.current_middle_y+1] == 0 then
                rotatable = false
            end
        else
            if _G.current_middle_x-1 > 1 or _G.block_table[_G.current_middle_x-1][_G.current_middle_y] == 0 then
                rotatable = false
            end
        end
    elseif _G.current_block == 4 then
        if _G.current_rotation == 0 then
            if _G.current_middle_y+1 > 20 or _G.block_table[_G.current_middle_x][_G.current_middle_y-1] == 0
            or _G.block_table[_G.current_middle_x-1][_G.current_middle_y+1] == 0
            or _G.block_table[_G.current_middle_x][_G.current_middle_y+1] == 0 then
                rotatable = false
            end
        elseif _G.current_rotation == 1 then
            if _G.current_middle_x+1 > 10 or _G.block_table[_G.current_middle_x-1][_G.current_middle_y-1] == 0
            or _G.block_table[_G.current_middle_x-1][_G.current_middle_y] == 0
            or _G.block_table[_G.current_middle_x+1][_G.current_middle_y] == 0 then
                rotatable = false
            end
        elseif _G.current_rotation == 2 then
            if _G.current_middle_y+1 > 20 or _G.block_table[_G.current_middle_x][_G.current_middle_y-1] == 0
            or _G.block_table[_G.current_middle_x+1][_G.current_middle_y-1] == 0
            or _G.block_table[_G.current_middle_x][_G.current_middle_y+1] == 0 then
                rotatable = false
            end
        else
            if _G.current_middle_x-1 < 1 or _G.block_table[_G.current_middle_x-1][_G.current_middle_y] == 0
            or _G.block_table[_G.current_middle_x+1][_G.current_middle_y] == 0
            or _G.block_table[_G.current_middle_x+1][_G.current_middle_y+1] == 0 then
                rotatable = false
            end
        end
    else
        if _G.current_rotation == 0 then
            if _G.current_middle_y+1 > 20 or _G.block_table[_G.current_middle_x-1][_G.current_middle_y-1] == 0
            or _G.block_table[_G.current_middle_x][_G.current_middle_y-1] == 0
            or _G.block_table[_G.current_middle_x][_G.current_middle_y+1] == 0 then
                rotatable = false
            end
        elseif _G.current_rotation == 1 then
            if _G.current_middle_x+1 > 10 or _G.block_table[_G.current_middle_x+1][_G.current_middle_y-1] == 0
            or _G.block_table[_G.current_middle_x-1][_G.current_middle_y] == 0
            or _G.block_table[_G.current_middle_x+1][_G.current_middle_y] == 0 then
                rotatable = false
            end
        elseif _G.current_rotation == 2 then
            if _G.current_middle_y+1 > 20 or _G.block_table[_G.current_middle_x][_G.current_middle_y-1] == 0
            or _G.block_table[_G.current_middle_x][_G.current_middle_y+1] == 0
            or _G.block_table[_G.current_middle_x+1][_G.current_middle_y+1] == 0 then
                rotatable = false
            end
        else
            if _G.current_middle_x-1 < 1 or _G.block_table[_G.current_middle_x-1][_G.current_middle_y] == 0
            or _G.block_table[_G.current_middle_x+1][_G.current_middle_y] == 0
            or _G.block_table[_G.current_middle_x-1][_G.current_middle_y+1] == 0 then
                rotatable = false
            end
        end
    end

    if rotatable then
        _G.current_rotation = (_G.current_rotation+1)%4
    end
end


function gameOver()
    love.event.quit()
end


function setup()
    love.graphics.setColor(love.math.colorFromBytes(50, 75, 175))
    love.graphics.rectangle('fill', 239, 79, _G.block_width*10+22, block_width*20+42)

    love.graphics.rectangle('fill', 561, 79, _G.block_width*4+10, block_width*4+10)
    love.graphics.setColor(love.math.colorFromBytes(20, 20, 20))
    for i = 1, 4 do
        for j = 1, 4 do
            love.graphics.rectangle('fill', 2+(i-1)*(2+_G.block_width)+561, 2+(j-1)*(2+_G.block_width)+79, _G.block_width, _G.block_width)
        end
    end
end


function drawTable()
    love.graphics.setColor(love.math.colorFromBytes(20, 20, 20))
    for i = 1, 10 do
        for j = 1, 20 do
            if _G.block_table[i][j] == -1 then
                love.graphics.setColor(love.math.colorFromBytes(20, 20, 20))
            elseif _G.block_table[i][j] == 0 then
                love.graphics.setColor(love.math.colorFromBytes(50, 150, 50))
            else
                love.graphics.setColor(love.math.colorFromBytes(150, 25, 25))
                _G.block_table[i][j] = -1
            end
            love.graphics.rectangle('fill', 2+(i-1)*(2+_G.block_width)+239, 2+(j-1)*(2+_G.block_width)+79, _G.block_width, _G.block_width)
        end
    end
end


function drawNext()
    love.graphics.setColor(love.math.colorFromBytes(250, 250, 0))
    if _G.next_block == 1 then
        love.graphics.rectangle('fill', 2+1*(2+_G.block_width)+561, 2+1*(2+_G.block_width)+79, _G.block_width, _G.block_width)
        love.graphics.rectangle('fill', 2+2*(2+_G.block_width)+561, 2+1*(2+_G.block_width)+79, _G.block_width, _G.block_width)
        love.graphics.rectangle('fill', 2+1*(2+_G.block_width)+561, 2+2*(2+_G.block_width)+79, _G.block_width, _G.block_width)
        love.graphics.rectangle('fill', 2+2*(2+_G.block_width)+561, 2+2*(2+_G.block_width)+79, _G.block_width, _G.block_width)
    elseif _G.next_block == 2 then
        love.graphics.rectangle('fill', 2+0*(2+_G.block_width)+561, 2+1*(2+_G.block_width)+79, _G.block_width, _G.block_width)
        love.graphics.rectangle('fill', 2+1*(2+_G.block_width)+561, 2+1*(2+_G.block_width)+79, _G.block_width, _G.block_width)
        love.graphics.rectangle('fill', 2+2*(2+_G.block_width)+561, 2+1*(2+_G.block_width)+79, _G.block_width, _G.block_width)
        love.graphics.rectangle('fill', 2+3*(2+_G.block_width)+561, 2+1*(2+_G.block_width)+79, _G.block_width, _G.block_width)
    elseif _G.next_block == 3 then
        love.graphics.rectangle('fill', 2+0*(2+_G.block_width)+561, 2+1*(2+_G.block_width)+79, _G.block_width, _G.block_width)
        love.graphics.rectangle('fill', 2+1*(2+_G.block_width)+561, 2+1*(2+_G.block_width)+79, _G.block_width, _G.block_width)
        love.graphics.rectangle('fill', 2+2*(2+_G.block_width)+561, 2+1*(2+_G.block_width)+79, _G.block_width, _G.block_width)
        love.graphics.rectangle('fill', 2+1*(2+_G.block_width)+561, 2+2*(2+_G.block_width)+79, _G.block_width, _G.block_width)
    elseif _G.next_block == 4 then
        love.graphics.rectangle('fill', 2+0*(2+_G.block_width)+561, 2+1*(2+_G.block_width)+79, _G.block_width, _G.block_width)
        love.graphics.rectangle('fill', 2+1*(2+_G.block_width)+561, 2+1*(2+_G.block_width)+79, _G.block_width, _G.block_width)
        love.graphics.rectangle('fill', 2+2*(2+_G.block_width)+561, 2+1*(2+_G.block_width)+79, _G.block_width, _G.block_width)
        love.graphics.rectangle('fill', 2+2*(2+_G.block_width)+561, 2+2*(2+_G.block_width)+79, _G.block_width, _G.block_width)
    else
        love.graphics.rectangle('fill', 2+2*(2+_G.block_width)+561, 2+0*(2+_G.block_width)+79, _G.block_width, _G.block_width)
        love.graphics.rectangle('fill', 2+0*(2+_G.block_width)+561, 2+1*(2+_G.block_width)+79, _G.block_width, _G.block_width)
        love.graphics.rectangle('fill', 2+1*(2+_G.block_width)+561, 2+1*(2+_G.block_width)+79, _G.block_width, _G.block_width)
        love.graphics.rectangle('fill', 2+2*(2+_G.block_width)+561, 2+1*(2+_G.block_width)+79, _G.block_width, _G.block_width)
    end
end


function love.load()
    math.randomseed(os.time())

    love.graphics.setBackgroundColor(love.math.colorFromBytes(20, 20, 20))

    _G.block_width = 30
    _G.current_block = math.random(5)
    _G.current_middle_x = 6
    _G.current_middle_y = 2
    _G.current_rotation = 0
    _G.next_block = math.random(5)

    _G.fall_timer = 0
    _G.move_timer = 0
    _G.rotate_timer = 0

    _G.block_table = {}
    for i = 1, 10 do
        table.insert(block_table, {})
        for j = 1, 20 do
            table.insert(block_table[i], -1)
        end
    end
end


function love.update(dt)
    createShape()
    _G.fall_timer = _G.fall_timer+dt
    _G.move_timer = _G.move_timer+dt
    _G.rotate_timer = _G.rotate_timer+dt

    tier = 0.5

    if _G.fall_timer >= tier then
        fall()
        _G.fall_timer = _G.fall_timer%tier
    end

    if _G.move_timer >= 0.1 then
        if love.keyboard.isDown('left') then
            move(-1)
        elseif love.keyboard.isDown('right') then
            move(1)
        end
        _G.move_timer = 0
    end
    
    if _G.rotate_timer >= 0.15 then
        if love.keyboard.isDown('z') then
            rotate()
        end
        _G.rotate_timer = 0
    end
end


function love.draw()
    setup()
    drawTable()
    drawNext()
end

-- 10 x 20
-- math.randomseed(os.time())
--[[
    love.graphics.setColor(love.math.colorFromBytes(20, 20, 20))
    for i = 1, 10 do
        for j = 1, 20 do
            love.graphics.rectangle('fill', _G.width/4, _G.height/12, _G.width/2, _G.height*5/6)
        end
    end
    ]]