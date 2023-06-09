local connURL = "ws://2.tcp.eu.ngrok.io:18953"
local ws, err = http.websocket(connURL)

if ws then
    ws.send("Khao's Remote Turtle")
    while true do
        local msg = ws.receive()
        print(msg)
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
