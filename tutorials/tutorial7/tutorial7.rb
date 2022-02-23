class Person
  attr_accessor :name

  def initialize(name)
    @p_name = name
  end

  def name
    p "Name: #{@p_name}"
  end
end

class Student < Person
  attr_accessor :roll_no

  def initialize(name, roll_no)
    @p_name = name
    @s_roll_no = roll_no
  end

  def roll_no
    p "Roll number: #{@s_roll_no}"
  end
end

p "Person or Student ?"
input = gets.chomp.to_s.downcase
if input === "person"
  p "Enter name:"
  Person.new(gets.chomp.to_s).name
elsif input === "student"
  p "Enter name:"
  name = gets.chomp.to_s
  p "Enter roll number:"
  roll_no = gets.chomp.to_s
  Student.new(name, roll_no).name
  Student.new(name, roll_no).roll_no
else
  p "Invalid input"
end
