local shops = { -- Template {['x'] = , ['y'] = , ['z'] = },
    {['x'] = 1768.97, ['y'] = 3329.44, ['z'] = 41.44},
    {['x'] = 356.146, ['y'] = 134.69, ['z'] = 39.0097},
    {['x'] = 723.013, ['y'] = -1088.92, ['z'] = 22.1829},
    {['x'] = -1145.67, ['y'] = -1991.17, ['z'] = 13.162},
    {['x'] = 1174.76, ['y'] = 2645.46, ['z'] = 37.7545},
    {['x'] = 112.275, ['y'] = 6619.83, ['z'] = 31.8154},
    {['x'] = -207.978, ['y'] = -1309.64, ['z'] = -31.2939},
}

RegisterCommand("fix", function() -- Change "Fix" If you want a diffrent command 
		
	local ped = PlayerPedId()
	local veh = GetVehiclePedIsIn(ped, false)

    for i = 1, #shops, 1 do
	-- Makes Sure Ped Is In A Car	
        if veh ~= 0 and GetPedInVehicleSeat(veh, -1) == ped then
		-- Make Sure Ped Is Winin A Circle Radius Of The Mech Shop
            if (GetDistanceBetweenCoords(shops[i].x, shops[i].y, shops[i].z, GetEntityCoords(ped))) < 15 then
		-- Fixing The Car
                SetVehicleFixed(veh)
                SetVehicleDeformationFixed(veh)
                SetVehicleUndriveable(veh, false)
		-- This Is For A Text Pop Up On The Top Left	
                    SetTextComponentFormat("STRING")
                    AddTextComponentString("~g~Vehicle Fully Fixed!")
                    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
                    -- Just A Console Print (Can Remove If You Want)
                    print'full Fixed'
		-- Make Sure Ped Is Outside Of The Radius Of The Mech Shop
                else if (GetDistanceBetweenCoords(shops[i].x, shops[i].y, shops[i].z, GetEntityCoords(ped))) > 15 then

                    local health = GetVehicleEngineHealth(veh)
			-- Makes Sure Car Is Below 500 Health
                    if health <= 500 then
		-- Half Fix The Car
                SetVehicleEngineHealth(veh, 700)
                SetVehicleUndriveable(veh, false)
		-- This Is For A Text Pop Up On The Top Left	
                    SetTextComponentFormat("STRING")
                    AddTextComponentString("~g~Vehicle Partly Fixed To Get A Mechanic!")
                    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
		-- Just A Console Print (Can Remove If You Want)
                    print'half fixed'
	        end
        end
    end
end
end
end)
