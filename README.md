# JayDiscordPresence

JayDiscordPresence is a simple script for FiveM servers that allows them to customize the display of a user's discord status while they are on the server.

## Preview
![Script Preview](https://i.imgur.com/5pkqyj2.png)

## Installation

Download the script [here](https://github.com/JayPaulinCodes/JayDiscordPresence/releases) and extract files to your FiveM server's resources folder and add the following to your server.cfg file.

```txt
ensure JayDiscordPresence
```

## Setup
Start by visiting the [Discord Developer Portal](https://discord.com/developers/applications/) and creating a new application.

![Discord Developer Portal](https://i.imgur.com/EQZuuWe.png)

Give your application a name and create it. Once on your application's page copy your application ID by using the copy button under the application ID.

Paste the application ID in the config.lua file in this location:
```lua
discodAppID = YOUR_APPLICATION_ID_HERE, -- The discord application id
```
Next on your application's page, on the left bar click "Rich Presence" and then "Art Assets" 

Once here you can add images to your application by using the "Add Image(s)" button near the bottom of the page. 

To make these images appear on the discord presence fill the config.lua file with the image(AKA assets) names in the following fields:
```lua
    largeIconAssetName = YOUR_IMAGE_NAME, -- This is the asset name of the large icon on your discord application
    largeIconHoverText = "Cool Text", -- This is the text to display when the large icon is hovered 

    useSmallIcon = true, -- Do you want a small icon to be displayed?
    smallIconAssetName = YOUR_IMAGE_NAME, -- This is the asset name of the small icon on your discord application
    smallIconHoverText = "A FiveM Server!", -- This is the text to display when the small icon is hovered 
```

And that's it! Configure the remainder of the config.lua and your good to go.

## License
[MIT](https://choosealicense.com/licenses/mit/)
