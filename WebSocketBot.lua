local connURL = "wss://0.tcp.ap.ngrok.io:11744"
local ws, err = http.websocket(connURL)

if ws then
    while true do
        local msg = ws.receive()
        if msg == "forward" then
            turtle.forward()
        else if msg == "refuel" then
            turtle.refuel()
        else if msg == "back" then
            turtle.back()
        else if msg == "left" then
            turtle.turnLeft()
        else if msg == "right" then
            turtle.turnRight()
        end
    end
end
