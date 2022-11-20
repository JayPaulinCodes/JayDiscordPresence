function ternary ( cond , T , F )
    if cond then return T else return F end
end

--[[
    Discord.setLargeIcon(AssteName, HoverText)

    Sets the large icon of the discord presence.

    @param AssetName - String - The asset name of the icon to set.
    @param HoverText - String - The text to display when hoveing over the icon.
]]
function Discord_setLargeIcon(AssetName, HoverText)
    SetDiscordRichPresenceAsset(AssetName)
    SetDiscordRichPresenceAssetText(HoverText)
end

--[[
    Discord.setSmallIcon(AssteName, HoverText)

    Sets the small icon of the discord presence.

    @param AssetName - String - The asset name of the icon to set.
    @param HoverText - String - The text to display when hoveing over the icon.
]]
function Discord_setSmallIcon(AssetName, HoverText)
    SetDiscordRichPresenceAssetSmall(AssetName)
    SetDiscordRichPresenceAssetSmallText(HoverText)
end

--[[
    Discord.setButton(ButtonId, ButtonLabel, ButtonURL)

    Sets a button on the discord presence

    @param ButtonId - Number - The id of the button to set.
    @param ButtonLabel - String - The text to display on the button.
    @param ButtonURL - String - The URL the button should send users to on click.
]]
function Discord_setButton(ButtonId, ButtonLabel, ButtonURL)
    SetDiscordRichPresenceAction(ButtonId, ButtonLabel, ButtonURL)
end

--[[
    replacePlaceholdersInText(Text, ReplacementText_Street, ReplacementText_Vehicle, ReplacementText_Speed, ReplacementText_Zone)

    Replaces certain placeholders in a string of text with specified text.

    @param Text - String - The string of text with the placeholders that need replacing.
    @param ReplacementText_Street - String/nil - The text to replace the _STREET_ placeholder with.
    @param ReplacementText_Vehicle - String/nil - The text to replace the _VEHICLE_ placeholder with.
    @param ReplacementText_Speed - String/nil - The text to replace the _SPEED_ placeholder with.
    @param ReplacementText_Zone - String/nil - The text to replace the _ZONE_ placeholder with.
]]
function replacePlaceholdersInText(Text, ReplacementText_Street, ReplacementText_Vehicle, ReplacementText_Speed, ReplacementText_Zone)
    local _text = Text

    if ReplacementText_Street ~= nil and string.find(_text, "_STREET_") then _text = _text:gsub("_STREET_", ReplacementText_Street) end
    if ReplacementText_Vehicle ~= nil and string.find(_text, "_VEHICLE_") then _text = _text:gsub("_VEHICLE_", ReplacementText_Vehicle) end
    if ReplacementText_Speed ~= nil and string.find(_text, "_SPEED_") then _text = _text:gsub("_SPEED_", ReplacementText_Speed) end
    if ReplacementText_Zone ~= nil and string.find(_text, "_ZONE_") then _text = _text:gsub("_ZONE_", ReplacementText_Zone) end

    return _text
end