require "date"

d = Date.today
arr = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
a = 5

while a > 0
  arr.length.times do |i|
    if d.prev_day(a).wday === i
      p arr[i]
    end
  end
  a = a - 1
end
