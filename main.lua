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

function Utils.SendDiscordWebhook(url, data)
	local createdBody = Utils.CreateDiscordEmbeds(data)
	print(createdBody)
	return Utils.PostAsync(url, createdBody)
end

function Utils.PostAsync(url,body)
	local response = request({
	Url = url,
	Method = "POST",
	Headers = {
		["Content-Type"] = "application/json"
	},
	Body = body
	})
	return response
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

