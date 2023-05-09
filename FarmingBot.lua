-- Set up the turtle's starting position
local startX, startY, startZ = 0, 0, 0
local currX, currY, currZ = startX, startY, startZ

-- Define the length of the rows and the number of rows to harvest
local rowLength = 9
local numRows = 9
local crop = "minecraft:wheat"

-- Define the age of wheat to harvest
local harvestAge = 7

-- Start harvesting and planting
for row = 1, numRows do
  -- Harvest the wheat in the current row
  for i = 1, rowLength do
    -- Check if the current block is wheat and has the correct age
    local success, data = turtle.inspectDown()
    if success and data.name == crop and data.state.age == harvestAge then
      turtle.digDown()
      turtle.select(1)
      turtle.placeDown()
    end
    
    -- Move to the next block
    if i < rowLength then
      turtle.forward()
      currX = currX + 1
    end
  end
  
  -- Move to the next row
  if row < numRows then
    if row % 2 == 1 then
      -- If the row number is odd, turn left at the end of the row
      turtle.turnLeft()
      turtle.forward()
      turtle.turnLeft()
      currX = startX
      currZ = currZ + 1
    else
      -- If the row number is even, turn right at the end of the row
      turtle.turnRight()
      turtle.forward()
      turtle.turnRight()
      currX = startX + rowLength - 1
      currZ = currZ + 1
    end
  end
end

-- Return to the starting position
-- Return to the starting position
while currX ~= startX or currY ~= startY or currZ ~= startZ do
  if currZ > startZ then
    -- Face north and move forward
    turtle.turnRight()
    turtle.turnRight()
    turtle.forward()
    currZ = currZ - 1
  elseif currZ < startZ then
    -- Face south and move forward
    turtle.forward()
    currZ = currZ + 1
  elseif currX > startX then
    -- Face west and move forward
    turtle.turnLeft()
    turtle.forward()
    currX = currX - 1
  elseif currX < startX then
    -- Face east and move forward
    turtle.turnRight()
    turtle.forward()
    currX = currX + 1
  elseif currY > startY then
    -- Move down
    turtle.down()
    currY = currY - 1
  elseif currY < startY then
    -- Move up
    turtle.up()
    currY = currY + 1
  end
end