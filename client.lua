-- Open the report UI with /report command
RegisterCommand("report", function()
    SetNuiFocus(true, true) -- Set focus to the UI (allow input)
    SendNUIMessage({ action = "open" }) -- Send a message to open the UI
end)

-- Close the report UI
RegisterNUICallback('close', function()
    SetNuiFocus(false, false) -- Remove focus from the UI
    SendNUIMessage({ action = "close" }) -- Send a message to close the UI
end)

-- Handle the submission of the report
RegisterNUICallback('submitReport', function(data)
    TriggerServerEvent('report:send', data) -- Send report data to the server

    -- Hide the UI
    display = false
    SetNuiFocus(false, false)  -- Remove focus from the NUI
    SendNUIMessage({ action = 'close', display = false })  -- Hide the UI
end)
