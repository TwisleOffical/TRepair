local shops = {
    {['x'] = 1768.97, ['y'] = 3329.44, ['z'] = 41.44},
    {['x'] = 356.146, ['y'] = 134.69, ['z'] = 39.0097},
    {['x'] = 723.013, ['y'] = -1088.92, ['z'] = 22.1829},
    {['x'] = -1145.67, ['y'] = -1991.17, ['z'] = 13.162},
    {['x'] = 1174.76, ['y'] = 2645.46, ['z'] = 37.7545},
    {['x'] = 112.275, ['y'] = 6619.83, ['z'] = 31.8154},
    {['x'] = -207.978, ['y'] = -1309.64, ['z'] = -31.2939},
}
RegisterCommand("fixer", function()
	local ped = PlayerPedId()
	local veh = GetVehiclePedIsIn(ped, false)

    for i = 1, #shops, 1 do
        if veh ~= 0 and GetPedInVehicleSeat(veh, -1) == ped then

            if (GetDistanceBetweenCoords(shops[i].x, shops[i].y, shops[i].z, GetEntityCoords(ped))) < 15 then

                SetVehicleFixed(veh)
                SetVehicleDeformationFixed(veh)
                SetVehicleUndriveable(veh, false)

                    SetTextComponentFormat("STRING")
                    AddTextComponentString("~g~Vehicle Fully Fixed!")
                    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
                    
                    print'full Fixed'

                else if (GetDistanceBetweenCoords(shops[i].x, shops[i].y, shops[i].z, GetEntityCoords(ped))) > 15 then

                    local health = GetVehicleEngineHealth(veh)

                    if health <= 500 then

                SetVehicleEngineHealth(veh, 700)
                SetVehicleUndriveable(veh, false)

                    SetTextComponentFormat("STRING")
                    AddTextComponentString("~g~Vehicle Partly Fixed To Get A Mechanic!")
                    DisplayHelpTextFromStringLabel(0, 0, 1, -1)

                    print'half fixed'
	        end
        end
    end
end
end
end)