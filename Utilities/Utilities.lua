--[[
    This Utility file is really only helpful and relevant to the Cheats I create for my friends.
    However, feel free to use it if it's useful for you. I occasionally update it to add more Utilities 
    I frequently use. Code can probably be optimized or remade better, I don't really code in LUA other than to
    make Roblox Cheats for my friends or myself.
]]

local HTTPRequest = syn and syn.request or http and http.request or http_request or fluxus and fluxus.request or request
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local LocalPlayer = Players.LocalPlayer

local Utilities = {} do
    Utilities.Folder = "Mercenary/Utilities/"

    function Utilities:SendWebhookMessage(url, message, embed)
        if not url or not message or not embed then
            return
        end

        task.spawn(function()            
            HTTPRequest({
                Url = url,
                Method = "POST",
                Headers = {
                    ["Content-Type"] = "application/json"
                },
                Body = HttpService:JSONEncode({
                    content = message, embeds = { 
                        embed 
                    } 
                })
            })
        end)
    end

    function Utilities:CheckFunctionExists(functionName)
        local IsValid = functionName and getgenv()[functionName]
        
        if not IsValid then
            LocalPlayer:Kick(string.format("Executor Not Supported. Missing: %s", functionName))
            return
        end
    end

    function Utilities:CheckFunctionExistsTable(functionNames)
        for _, functionName in ipairs(functionNames) do
            local IsValid = functionName and getgenv()[functionName]
            
            if not IsValid then
                LocalPlayer:Kick(string.format("Executor Not Supported. Missing: %s", functionName))
                return
            end
        end
    end

    function Utilities:GetExecutions()
        if not isfolder(self.Folder) then 
            makefolder(self.Folder) end
        if not isfile(self.Folder .. "Executions.txt") then  
            writefile(self.Folder .. "Executions.txt", "0") end
        
        writefile(self.Folder .. "Executions.txt", tostring(readfile(self.Folder .. "Executions.txt") or 0) + 1)
        
        return tostring(readfile(self.Folder .. "Executions.txt"))
    end

    function Utilities:GetExecutorHWID()
        local ExecutorHWID = get_hwid and get_hwid() or gethwid and gethwid() or hwid

        return ExecutorHWID
    end

    function Utilities:GetExecutor()
        local Executor = identifyexecutor and identifyexecutor() or getexecutorname and getexecutorname()

        return Executor
    end

    function Utilities:GetCurrentGame()
        return game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
    end

    function Utilities:GetGameJobId()
        return game.JobId
    end
end

return Utilities
