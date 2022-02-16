require 'date'

def age(dob)
  now = Time.now.utc.to_date
  age =  now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  print age, (age > 18 ? ', adult' : ', child')
end
puts "Enter Your Date of Birth(Ex:1990/10/16)"
age(DateTime.parse(gets.chomp))