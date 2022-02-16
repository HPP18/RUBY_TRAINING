x = 1
a = 2
s = 5
t = 1
while x > 0
    puts " " * s+ '*' * x
    x = x + a
    s = s - t
    if x == 11 && s == 0
        a = -2
        t = -1
    end
end