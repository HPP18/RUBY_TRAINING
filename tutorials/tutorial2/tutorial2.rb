require "date"

def age(dob)
  if dob < Time.now.utc.to_date
    now = Time.now.utc.to_date
    age = now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
    p age, (age > 18 ? "adult" : "child")
  else
    p "your age is invalid"
  end
end

puts "Enter Your Date of Birth(Ex:1990/10/16)"
age(Date.parse(gets.chomp))
