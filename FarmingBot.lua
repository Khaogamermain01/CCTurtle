local success, data = turtle.inspectDown()

if not success or data.name ~= "minecraft:wheat" then
    print("Place Turtle on Wheat!")
    return
end

function findItemSlot(itemName)
    for slot = 1, 16 do 
        local item = turtle.getItemDetail(slot)
        if item and item.name == itemName then 
            return slot 
        end
    end
    return nil
end

while true do
    success, data = turtle.inspectDown()
    if success and data.name == "minecraft:wheat" then
        if data.state.age == 7 then
            turtle.digDown()
            turtle.placeDown()
            turtle.forward()
        else
            os.sleep(300)  -- wait 5 minutes before checking again
        end
    else
        turtle.back()
        turtle.turnLeft()
        turtle.turnLeft()
    end
end