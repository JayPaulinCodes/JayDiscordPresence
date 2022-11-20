Citizen.CreateThread(function()
	while true do
		SetDiscordAppId(config.discodAppID)

        -- Setting the large icon
        Discord.setLargeIcon(config.largeIconAssetName, config.largeIconHoverText)
       
        -- Setting the small icon
        if config.useSmallIcon then Discord.setLargeIcon(config.smallIconAssetName, config.smallIconHoverText) end

        -- Setting button 1
        if config.buttons.button1.enabled then Discord.setButton(0, config.buttons.button1.text, config.buttons.button1.url) end

        -- Setting button 2
        if config.buttons.button2.enabled and config.buttons.button1.enabled then
            Discord.setButton(1, config.buttons.button2.text, config.buttons.button2.url)
        elseif config.buttons.button2.enabled and not config.buttons.button1.enabled then
            Discord.setButton(0, config.buttons.button2.text, config.buttons.button2.url)
        end


        -- Location Logic
        if config.displayLocation then
            -- Get the user's x y z cords
            local x, y, z = table.unpack(GetEntityCoords(PlayerPedId(),true))
            
            -- Find the location of the player
            local StreetHash = GetStreetNameAtCoord(x, y, z)
            local Zone = GetNameOfZone(x, y, z)
            local ZoneLabel = GetLabelText(Zone)
            local text = nil
            local VehSpeed = nil
            local CurSpeed = nil
            local VehName = nil
            if StreetHash ~= nil then 
                StreetName = GetStreetNameFromHashKey(StreetHash)
            else 
                StreetName = ZoneLabel
            end


            if IsPedOnFoot(PlayerPedId()) and not IsEntityInWater(PlayerPedId()) then
				if IsPedSprinting(PlayerPedId()) then text = config.locationConfig.onFoot.sprinting
				elseif IsPedRunning(PlayerPedId()) then text = config.locationConfig.onFoot.running
				elseif IsPedWalking(PlayerPedId()) then text = config.locationConfig.onFoot.walking
				elseif IsPedStill(PlayerPedId()) then text = config.locationConfig.onFoot.standing end
            elseif GetVehiclePedIsUsing(PlayerPedId()) ~= nil then
                VehSpeed = GetEntitySpeed(GetVehiclePedIsUsing(PlayerPedId()))
			    CurSpeed = config.useMPH and math.ceil(VehSpeed * 2.236936) or math.ceil(VehSpeed * 3.6)
				VehName = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(PlayerPedId()))))

                if not IsPedInAnyHeli(PlayerPedId()) and not IsPedInAnyPlane(PlayerPedId()) and not IsPedOnFoot(PlayerPedId()) and not IsPedInAnySub(PlayerPedId()) and not IsPedInAnyBoat(PlayerPedId()) then
                    if CurSpeed > 0 then text = config.locationConfig.inCar.driving
                    else text = config.locationConfig.inCar.parked end
                elseif IsPedInAnyHeli(PlayerPedId()) or IsPedInAnyPlane(PlayerPedId()) then
                    if IsEntityInAir(GetVehiclePedIsUsing(PlayerPedId())) or GetEntityHeightAboveGround(GetVehiclePedIsUsing(PlayerPedId())) > 5.0 then text = config.locationConfig.inSky.flying
                    else text = config.locationConfig.inSky.stopped end
                elseif IsEntityInWater(PlayerPedId()) then text = config.locationConfig.onFoot.swiming
                elseif IsPedInAnyBoat(PlayerPedId()) and IsEntityInWater(GetVehiclePedIsUsing(PlayerPedId())) then text = config.locationConfig.inAquaVehicle.boat
                elseif IsPedInAnySub(PlayerPedId()) and IsEntityInWater(GetVehiclePedIsUsing(PlayerPedId())) then text = config.locationConfig.inAquaVehicle.submarine end
            end

            text = replacePlaceholdersInText(text, StreetName, VehName, ternary(config.useMPH == true, CurSpeed.." MPH", CurSpeed.." KM/H"), ZoneLabel)
            SetRichPresence(text)

        end

		Citizen.Wait(config.refreshRate)
	end
end)