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

local KleenexUtilities = {} do
    KleenexUtilities.Folder = "Kleenex/Utilities/"

    function KleenexUtilities:SendWebhookMessage(url, message, embed)
        task.spawn(function()
            if not #url > 0 then return end
            if not url or not message or not embed then
                return
            end

            self:CheckFunctionExists(HTTPRequest)
            
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

    function KleenexUtilities:CheckFunctionExists(functionName)
        task.spawn(function()
            local IsValid = functionName and getgenv()[functionName]
            
            if not IsValid then
                LocalPlayer:Kick(string.format("Executor Not Supported. Missing: %s", functionName))
                return
            end
        end)
    end

    function KleenexUtilities:CheckFunctionExistsTable(functionNames)
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

    function KleenexUtilities:GetExecutions()
        task.spawn(function()
            self:CheckFunctionExistsTable({ "isfolder", "isfile", "makefolder", "makefile" })

            if not isfolder(self.Folder) then 
                makefolder(self.Folder) end
            if not isfile(self.Folder .. "Executions.txt") then  
                writefile(self.Folder .. "Executions.txt", "1") end
            
            writefile(self.Folder .. "Executions.txt", tostring(readfile(self.Folder .. "Executions.txt") or 0) + 1)
            
            return tostring(readfile(self.Folder .. "Executions.txt"))
        end)
    end

    function KleenexUtilities:GetExecutorHWID()
        task.spawn(function()
            local ExecutorHWID = get_hwid and get_hwid() or gethwid and gethwid() or hwid
            self:CheckFunctionExists(ExecutorHWID)

            return ExecutorHWID
        end)
    end

    function KleenexUtilities:GetExecutor()
        task.spawn(function()
            local Executor = identifyexecutor and identifyexecutor() or getexecutorname and getexecutorname()
            self:CheckFunctionExists(Executor)

            return Executor
        end)
    end

    function KleenexUtilities:GetCurrentGame()
        return game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
    end

    function KleenexUtilities:GetGameJobId()
        return game.JobID
    end
end

return KleenexUtilities
