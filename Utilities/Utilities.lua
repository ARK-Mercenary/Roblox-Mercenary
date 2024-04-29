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
        task.spawn(function()
            if not url or not message or not embed then
                return
            end
            
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
        task.spawn(function()
            local IsValid = functionName and getgenv()[functionName]
            
            if not IsValid then
                LocalPlayer:Kick(string.format("Executor Not Supported. Missing: %s", functionName))
                return
            end
        end)
    end

    function Utilities:CheckFunctionExistsTable(functionNames)
        task.spawn(function()
            for _, functionName in ipairs(functionNames) do
                local IsValid = functionName and getgenv()[functionName]
                
                if not IsValid then
                    LocalPlayer:Kick(string.format("Executor Not Supported. Missing: %s", functionName))
                    return
                end
            end
        end)
    end

    function Utilities:GetExecutions()
        task.spawn(function()
            if not isfolder(self.Folder) then 
                makefolder(self.Folder) end
            if not isfile(self.Folder .. "Executions.txt") then  
                writefile(self.Folder .. "Executions.txt", "1") end
            
            writefile(self.Folder .. "Executions.txt", tostring(readfile(self.Folder .. "Executions.txt") or 0) + 1)
            
            return tostring(readfile(self.Folder .. "Executions.txt"))
        end)
    end

    function Utilities:GetExecutorHWID()
        task.spawn(function()
            local ExecutorHWID = get_hwid and get_hwid() or gethwid and gethwid() or hwid

            return tostring(ExecutorHWID)
        end)
    end

    function Utilities:GetExecutor()
        task.spawn(function()
            local Executor = identifyexecutor and identifyexecutor() or getexecutorname and getexecutorname()

            return tostring(Executor)
        end)
    end

    function Utilities:GetCurrentGame()
        return tostring(game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name)
    end

    function Utilities:GetGameJobId()
        return tostring(game.JobId)
    end
end

return Utilities
