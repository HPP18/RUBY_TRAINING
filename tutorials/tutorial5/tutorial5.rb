require "date"

d = Date.today
a = 5

while a > 0
  7.times do |i|
    if d.prev_day(a).wday === i
      p d.prev_day(a).strftime("%A")
    end
  end
  a = a - 1
end
