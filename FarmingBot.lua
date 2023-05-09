

-- Define the dimensions of the wheat farm
local farmWidth = 9
local farmLength = 9

-- Define the coordinates of the chest above the starting position

-- Define the slot number of the chest item

-- Set the turtle to face forward
turtle.forward()

-- Loop through each row of the farm
for row = 1, farmLength do

  -- Harvest the wheat in the current row
  for col = 1, farmWidth do
    turtle.digDown()
    turtle.forward()
  end

  -- Return to the start of the row
  if row % 2 == 0 then
    turtle.turnRight()
    turtle.forward()
    turtle.turnRight()
  else
    turtle.turnLeft()
    turtle.forward()
    turtle.turnLeft()
  end

end

-- Return the turtle to its starting position
turtle.turnRight()
turtle.turnRight()
for i = 1, farmLength do
  turtle.forward()
end
turtle.turnRight()
turtle.turnRight()
for i = 1, farmWidth do
  turtle.forward()
end

-- Deposit the harvested wheat into the chest