-- Continuously execute a loadstring every second
while true do
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Infernalblight/Dolhin-Tsb-Private-Cheat/refs/heads/main/Kick.Leave.lua"))()
    end)
    wait(1) -- Wait 1 second before running again
end
