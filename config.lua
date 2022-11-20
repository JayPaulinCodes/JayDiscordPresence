config = {
    refreshRate = 2500, -- How fast to refresh the presence in MS
    discodAppID = 904853202820792340, -- The discord application id

    largeIconAssetName = "logo1", -- This is the asset name of the large icon on your discord application
    largeIconHoverText = "Some Cool Hover Text", -- This is the text to display when the large icon is hovered 

    useSmallIcon = true, -- Do you want a small icon to be displayed?
    smallIconAssetName = "logo2", -- This is the asset name of the small icon on your discord application
    smallIconHoverText = "A FiveM Server!", -- This is the text to display when the small icon is hovered 

    buttons = {
        button1 = {
            enabled = true, -- Is the Top Button enabled?
            text = "Join Our Discord!", -- The text to display on the top button
            -- Use the following in the url field bellow to connect to your fivem server fivem://connect/YourServerIPHere:30120
            -- NOTE: this has to start with "fivem://connect/" or "https://"
            url = "https://discord.gg/" -- The url to attach to the top button
        },

        button2 = {
            enabled = true, -- Is the Bottom Button enabled?
            text = "Connect To The Server!",  -- The text to display on the bottom button
            -- Use the following in the url field bellow to connect to your fivem server fivem://connect/YourServerIPHere:30120
            -- NOTE: this has to start with "fivem://connect/" or "https://"
            url = "fivem://connect/" -- The url to attach to the bottom button
        }
    },

    displayLocation = true, -- Whether to display the location of the player

    locationConfig = {
        useMPH = false, -- What unit to use to measure speed. (True = MPH, False = KM/H)

        --
        -- VARRIABLES:
        -- _STREET_ - Placeholder for the street name (ex: Alhambra Drive)
        -- _VEHICLE_ - Placeholder for the vehicle the user is in (ex: Ford F150)
        -- _SPEED_ - Placeholder for the speed of the user (ex: 100 KM/H, 60 MPH)
        -- _ZONE_ - Placeholder for the zone the player is in (ex: Alamo Sea)
        --

        -- Displayed when the user is on foot, the different options include: standing, walking, running, sprinting, swiming
        onFoot = { -- Placeholders _VEHICLE_ and _SPEED_ are not supported here
            standing = "Standing on _STREET_",
            walking = "Walking down _STREET_",
            running = "Running down _STREET_",
            sprinting = "Sprinting down _STREET_",
            swiming = "Swiming around _ZONE_"
        },

        -- Displayed when the user is in a vehicle, the different options include: parked, driving
        inCar = { 
            parked = "Stopped on _STREET_ in a _VEHICLE_", -- Placeholders _SPEED_ are not supported here
            driving = "Driving down _STREET_ at _SPEED_"
        },

        -- Displayed when the user is in a flying vehicle, the different options include: flying, stopped
        inSky = {
            stopped = "Landed around _STREET_ in a _VEHICLE_", -- Placeholders _SPEED_ are not supported here
            flying = "Flying over _STREET_ at _SPEED_"
        },

        -- Displayed when the user is in a aquatic vehicle, the different options include: boat, submarine
        inAquaVehicle = { -- Placeholders _SPEED_ are not supported here
            boat = "Sailing around _ZONE_ in a _VEHICLE_",
            submarine = "In a yelow submarine" -- All Placeholders are not supported here
        }
    }
}