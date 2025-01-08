if GetResourceState('rcore_doorlock') ~= 'started' then return end

Doorlock = {}

Doorlock.GetClosestDoor = function()
    local allDoors = exports.rcore_doorlock:getLoadedDoors()
    local pedCoords = GetEntityCoords(cache.ped)
    local door = 0
    local doorDist = 1000.0
    for _, data in pairs(allDoors) do
        local dist = #(pedCoords - data.coords)
        if dist < doorDist then
            door = data.id
            doorDist = dist
        end
    end
    return door
end