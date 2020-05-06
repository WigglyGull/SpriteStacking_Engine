local Player = {}

local insert = table.insert 
local remove = table.remove

function Player:Create()
    player = {}

    player.x = 0 
    player.y = 0  

    return player
end



return Player