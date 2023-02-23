local Args = { ... }

if #Args == 0
then
    print("Need set tunnel length")
    return
end

local length = tonumber(Args[1])

while length > 0 do

    while turtle.detect() do
        turtle.dig()
    end

    turtle.forward()

    length = length - 1

    turtle.digDown()

    while turtle.detectUp() do
        turtle.digUp()
    end

end