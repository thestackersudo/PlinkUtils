local Utils = {}

Utils.Workspace = game:GetService("Workspace")
Utils.ReplicatedStorage = game:GetService("ReplicatedStorage")
Utils.Players = game:GetService("Players")
Utils.VirtualUser = game:GetService("VirtualUser")
Utils.HttpService = game:GetService("HttpService")
Utils.Request = 
	request
	or http_request

if not Utils.Request then
	Utils.Request = function(data)
		return HttpService:RequestAsync(data)
	end
end

function Utils.RemoveSpaces(text)
	return text:gsub(" ", "")
end

function Utils.PrintTable(table)
	for i,v in pairs(table) do
		print(i,v)
	end
end

function Utils.SendDiscordWebhook(url, data)
	local createdBody = Utils.CreateDiscordEmbeds(data)
	return Utils.PostAsync(url, createdBody)
end

function Utils.Post(url,body)
	Utils.Request({
	Url = url,
	Method = "POST",
	Headers = {
		["Content-Type"] = "application/json"
	},
	Body = body
	})
end

function Utils.CreateDiscordEmbeds(data)
	local body = {
		content = data.content,
		embeds = {
			{
				title = data.title,
				description = data.description,
				color = 5814783,
				footer = {
					text = "Plink Utils"
				},
				timestamp = DateTime.now():ToIsoDate(),
			}
		},
		attachments = {}
	}
	return Utils.HttpService:JSONEncode(body)
end

-- Example JSON for Webhook
-- local body = {
-- 	content = "content",
-- 	title = "title",
-- 	description = "description",
-- }

return Utils

