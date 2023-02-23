turtle.refuel()

while true do

    while turtle.detect() do
        turtle.dig()
    end

    turtle.forward()

    turtle.digDown()

    while turtle.detectUp() do
        turtle.digUp()
    end

end