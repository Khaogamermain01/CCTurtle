local connURL = "wss://0.tcp.ap.ngrok.io:11744"
local ws, err = http.websocket(connURL)

if ws then
    while true do
        local msg = ws.receive()
        if msg == "forward" then
            turtle.forward()
        elseif msg == "refuel" then
            turtle.refuel()
        elseif msg == "back" then
            turtle.back()
        elseif msg == "left" then
            turtle.turnLeft()
        elseif msg == "right" then
            turtle.turnRight()
        end
    end
end
