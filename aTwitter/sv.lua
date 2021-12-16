ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterNetEvent('atmos:plainte')
AddEventHandler('atmos:plainte', function(mess)
	local _src = source
	sendToDiscordWithSpecialURL( "Twitter","Nouveau Tweet",""..mess.."", 59647, ""..GetPlayerName(_src).."", Config.Webhook)
end)


function sendToDiscordWithSpecialURL (name,titre,message,color,atmos,url)
    local DiscordWebHook = url
	local embeds = {
		{
			["title"]=titre,
			["description"]=message,
			["type"]="rich",
			["color"] =color,
			["footer"]=  {
			["text"]= atmos
			},
		}
	}
    if message == nil or message == '' then return FALSE end
    PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end