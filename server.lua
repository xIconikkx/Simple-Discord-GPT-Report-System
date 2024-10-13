local DISCORD_WEBHOOK= 'YOUR_WEBHOOK_LINK_SIR'

RegisterServerEvent('report:send')
AddEventHandler('report:send', function(data)
    local playerName = GetPlayerName(source)  -- Get the player's name submitting the report
    local reportType = data.type or "Unknown"
    local reason = data.reason or "No reason provided"
    local description = data.content or "No description provided"
    
    -- Create the embed payload
    local embed = {
        {
            ["color"] = 16711680,  -- Red color (you can change this to other color codes)
            ["title"] = "New Report Submitted",
            ["description"] = "**Report Information**",
            ["fields"] = {
                {
                    ["name"] = "Report Type",
                    ["value"] = reportType,
                    ["inline"] = true
                },
                {
                    ["name"] = "Player Name",
                    ["value"] = playerName,
                    ["inline"] = true
                },
                {
                    ["name"] = "Reason",
                    ["value"] = reason,
                    ["inline"] = false
                },
                {
                    ["name"] = "Description",
                    ["value"] = description,
                    ["inline"] = false
                }
            },
            ["footer"] = {
                ["text"] = os.date('%Y-%m-%d %H:%M:%S'),  -- Timestamp in footer
            }
        }
    }

    -- Send the webhook with the embed
    PerformHttpRequest(DISCORD_WEBHOOK, function(err, text, headers) end, 'POST', json.encode({
        username = "Report Bot",
        embeds = embed
    }), { ['Content-Type'] = 'application/json' })
end)