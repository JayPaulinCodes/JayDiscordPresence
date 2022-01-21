Citizen.CreateThread(function()
	while true do
		SetDiscordAppId(config.discodAppID)

        -- Setting the large icon
		SetDiscordRichPresenceAsset(config.largeIconAssetName)
        SetDiscordRichPresenceAssetText(config.largeIconHoverText)
       
        -- Setting the small icon
        if config.useSmallIcon then 
            SetDiscordRichPresenceAssetSmall(config.smallIconAssetName)
            SetDiscordRichPresenceAssetSmallText(config.smallIconHoverText)
        end

        -- Setting the button 2
        if config.buttons.button1.enabled then 
            SetDiscordRichPresenceAction(0, config.buttons.button1.text, config.buttons.button1.url)
        end 

        -- Setting the button 2
        if config.buttons.button2.enabled and config.buttons.button1.enabled then
            SetDiscordRichPresenceAction(1, config.buttons.button2.text, config.buttons.button2.url)
        elseif config.buttons.button2.enabled and not config.buttons.button1.enabled then
            SetDiscordRichPresenceAction(0, config.buttons.button2.text, config.buttons.button2.url)
        end


        -- Location Logic
        if config.displayLocation then
            -- Get the user's x y z cords
            local x, y, z = table.unpack(GetEntityCoords(PlayerPedId(),true))
            
            -- Find the location of the player
            local StreetHash = GetStreetNameAtCoord(x, y, z)
            local Zone = GetNameOfZone(x, y, z)
            local ZoneLabel = GetLabelText(Zone)
            if StreetHash ~= nil then 
                StreetName = GetStreetNameFromHashKey(StreetHash)
            else 
                StreetName = ZoneLabel
            end


            if IsPedOnFoot(PlayerPedId()) and not IsEntityInWater(PlayerPedId()) then

				if IsPedSprinting(PlayerPedId()) then

                    text = config.locationConfig.onFoot.sprinting
                    if string.find(text, "_STREET_") then
                        text = text:gsub("_STREET_", StreetName)
                    end
                    if string.find(text, "_ZONE_") then
                        text = text:gsub("_ZONE_", ZoneLabel)
                    end

					SetRichPresence(text)

				elseif IsPedRunning(PlayerPedId()) then
					
                    text = config.locationConfig.onFoot.running
                    if string.find(text, "_STREET_") then
                        
                        text = text:gsub("_STREET_", StreetName)
                    end
                    if string.find(text, "_ZONE_") then
                        print(2)
                        text = text:gsub("_ZONE_", ZoneLabel)
                    end

					SetRichPresence(text)

				elseif IsPedWalking(PlayerPedId()) then

                    text = config.locationConfig.onFoot.walking
                    if string.find(text, "_STREET_") then
                        text = text:gsub("_STREET_", StreetName)
                    end
                    if string.find(text, "_ZONE_") then
                        text = text:gsub("_ZONE_", ZoneLabel)
                    end

					SetRichPresence(text)

				elseif IsPedStill(PlayerPedId()) then

                    text = config.locationConfig.onFoot.standing
                    if string.find(text, "_STREET_") then
                        text = text:gsub("_STREET_", StreetName)
                    end
                    if string.find(text, "_ZONE_") then
                        text = text:gsub("_ZONE_", ZoneLabel)
                    end

					SetRichPresence(text)

				end

			elseif GetVehiclePedIsUsing(PlayerPedId()) ~= nil and not IsPedInAnyHeli(PlayerPedId()) and not IsPedInAnyPlane(PlayerPedId()) and not IsPedOnFoot(PlayerPedId()) and not IsPedInAnySub(PlayerPedId()) and not IsPedInAnyBoat(PlayerPedId()) then
				
                local VehSpeed = GetEntitySpeed(GetVehiclePedIsUsing(PlayerPedId()))
				local CurSpeed = config.useMPH and math.ceil(VehSpeed * 2.236936) or math.ceil(VehSpeed * 3.6)
				local VehName = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(PlayerPedId()))))
				
                if CurSpeed > 0 then

                    text = config.locationConfig.inCar.driving
                    if string.find(text, "_STREET_") then
                        text = text:gsub("_STREET_", StreetName)
                    end
                    if string.find(text, "_ZONE_") then
                        text = text:gsub("_ZONE_", ZoneLabel)
                    end
                    if string.find(text, "_SPEED_") and config.useMPH then
                        text = text:gsub("_SPEED_", CurSpeed.." MPH")
                    end
                    if string.find(text, "_SPEED_") and not config.useMPH then
                        text = text:gsub("_SPEED_", CurSpeed.." KM/H")
                    end
                    if string.find(text, "_VEHICLE_") then
                        text = text:gsub("_VEHICLE_", VehName)
                    end

					SetRichPresence(text)

				elseif CurSpeed == 0 then

                    text = config.locationConfig.inCar.parked
                    if string.find(text, "_STREET_") then
                        text = text:gsub("_STREET_", StreetName)
                    end
                    if string.find(text, "_ZONE_") then
                        text = text:gsub("_ZONE_", ZoneLabel)
                    end
                    if string.find(text, "_VEHICLE_") then
                        text = text:gsub("_VEHICLE_", VehName)
                    end

					SetRichPresence(text)

				end

			elseif IsPedInAnyHeli(PlayerPedId()) or IsPedInAnyPlane(PlayerPedId()) then

                local VehSpeed = GetEntitySpeed(GetVehiclePedIsUsing(PlayerPedId()))
				local CurSpeed = config.useMPH and math.ceil(VehSpeed * 2.236936) or math.ceil(VehSpeed * 3.6)
				local VehName = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(PlayerPedId()))))
				
                if IsEntityInAir(GetVehiclePedIsUsing(PlayerPedId())) or GetEntityHeightAboveGround(GetVehiclePedIsUsing(PlayerPedId())) > 5.0 then
                    
                    text = config.locationConfig.inSky.flying
                    if string.find(text, "_STREET_") then
                        text = text:gsub("_STREET_", StreetName)
                    end
                    if string.find(text, "_ZONE_") then
                        text = text:gsub("_ZONE_", ZoneLabel)
                    end
                    if string.find(text, "_SPEED_") and config.useMPH then
                        text = text:gsub("_SPEED_", CurSpeed.." MPH")
                    end
                    if string.find(text, "_SPEED_") and not config.useMPH then
                        text = text:gsub("_SPEED_", CurSpeed.." KM/H")
                    end
                    if string.find(text, "_VEHICLE_") then
                        text = text:gsub("_VEHICLE_", VehName)
                    end

					SetRichPresence(text)

				else

                    text = config.locationConfig.inSky.stopped
                    if string.find(text, "_STREET_") then
                        text = text:gsub("_STREET_", StreetName)
                    end
                    if string.find(text, "_ZONE_") then
                        text = text:gsub("_ZONE_", ZoneLabel)
                    end
                    if string.find(text, "_SPEED_") and config.useMPH then
                        text = text:gsub("_SPEED_", CurSpeed.." MPH")
                    end
                    if string.find(text, "_SPEED_") and not config.useMPH then
                        text = text:gsub("_SPEED_", CurSpeed.." KM/H")
                    end
                    if string.find(text, "_VEHICLE_") then
                        text = text:gsub("_VEHICLE_", VehName)
                    end

					SetRichPresence(text)

				end

			elseif IsEntityInWater(PlayerPedId()) then

                text = config.locationConfig.onFoot.swiming
                if string.find(text, "_STREET_") then
                    text = text:gsub("_STREET_", StreetName)
                end
                if string.find(text, "_ZONE_") then
                    text = text:gsub("_ZONE_", ZoneLabel)
                end

                SetRichPresence(text)
			
            elseif IsPedInAnyBoat(PlayerPedId()) and IsEntityInWater(GetVehiclePedIsUsing(PlayerPedId())) then
				
                local VehName = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(PlayerPedId()))))
				
                text = config.locationConfig.inAquaVehicle.boat
                if string.find(text, "_STREET_") then
                    text = text:gsub("_STREET_", StreetName)
                end
                if string.find(text, "_ZONE_") then
                    text = text:gsub("_ZONE_", ZoneLabel)
                end
                if string.find(text, "_VEHICLE_") then
                    text = text:gsub("_VEHICLE_", VehName)
                end

                SetRichPresence(text)
			
            elseif IsPedInAnySub(PlayerPedId()) and IsEntityInWater(GetVehiclePedIsUsing(PlayerPedId())) then
				
                text = config.locationConfig.inAquaVehicle.submarine

                SetRichPresence(text)

			end

        end


		Citizen.Wait(config.refreshRate)
	end
end)