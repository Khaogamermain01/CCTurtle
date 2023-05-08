local success, data = turtle.inspectDown()

if not data.name == "minecraft:wheat" then
    print("Place Turtle on Wheat!")
    return
end

function findItemSlot(itemName)
    for slot = 1, 16 do 
        if turtle.getItemDetail(slot) == itemName then 
            return slot 
        end
    end
    return nil
end


turned = true
while true do
    local success, data = turtle.inspectDown()

    if success then
        if data.name == "minecraft:wheat" then
            turtle.digDown()
            turtle.placeDown()
            turtle.forward()
        end
    else
        print("I'm meant to move backwards and not be a pussy")
        turtle.back()
        if turned then
            turtle.turnLeft()
            turned = not turned
        else
            turtle.turnRight()
            turned = not turned
        end
    end
end