local playerpoints = 0 
local stopmessshow = false 

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000) 

        local playerPed = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(playerPed, false)
        
        if vehicle ~= 0 and DoesEntityExist(vehicle) then
            local speed = GetEntitySpeed(vehicle) * 3.6 

            if speed > 70 then
                local pointsToAdd = math.floor((speed - 70) / 10) * 50 
                playerpoints = playerpoints + pointsToAdd
                SendNUIMessage({
                    action = 'updatePoints',
                    points = playerpoints
                })
            end
        end

        local velocity = GetEntitySpeedVector(vehicle, true)
        local speed = math.sqrt(velocity.x^2 + velocity.y^2 + velocity.z^2) * 3.6

        if speed < 1 and not stopmessshow then
            playerpoints = 0
            SendNUIMessage({
                action = 'resetPoints'
            })
            stopmessshow = true
        elseif speed > 1 then
            stopmessshow = false
        end
    end
end)
