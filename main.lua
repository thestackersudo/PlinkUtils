local Utils = {}

Utils.Workspace = game:GetService("Workspace")
Utils.ReplicatedStorage = game:GetService("ReplicatedStorage")
Utils.Players = game:GetService("Players")
Utils.VirtualUser = game:GetService("VirtualUser")
Utils.HttpService = game:GetService("HttpService")


function Utils.RemoveSpaces(text)
	return text:gsub(" ", "")
end

function Utils.PrintTable(table)
	for i,v in pairs(table) do
		print(i,v)
	end
end

function Utils.SendDiscordWebhook(url,body)
	return Utils.PostAsync(url, body)
end

function Utils.PostAsync(url,body)
	local response = request({
	Url = url,
	Method = "POST",
	Headers = {
		["Content-Type"] = "application/json"
	},
	Body = Utils.HttpService:JSONEncode(body)
	})
	return response
end

return Utils

