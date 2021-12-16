ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(5000)
    end
end)

RegisterCommand('twt', function(source, args, rawCommand)
    local src = source
	local msg = rawCommand:sub(5)
	local args = msg
    if player ~= false then
        local mess = KeyboardInput("fakeid_VORNAMEN", 'Votre Message :', "", 200)
        if mess ~= nil then
            mess = tostring(mess)
            if type(mess) == 'string' then
                ESX.ShowNotification('Vous venez de tweet : ~b~'..mess)
                TriggerServerEvent("atmos:plainte", mess)
            end
        end 
    end
end, false)

function KeyboardInput(entryTitle, textEntry, inputText, maxLength)
    AddTextEntry(entryTitle, textEntry)
    DisplayOnscreenKeyboard(1, entryTitle, "", inputText, "", "", "", maxLength)
	blockinput = true

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end
    if UpdateOnscreenKeyboard() ~= 2 then
        local delete = GetOnscreenKeyboardResult()
        Citizen.Wait(500)
		blockinput = false
        return delete
    else
        Citizen.Wait(500)
		blockinput = false
        return nil
    end
end
