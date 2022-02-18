p "Enter array length [1-10]: "
arr_length = gets.chomp.to_i

if (arr_length > 10)
  arr_length = 10
end
animal_array = Array.new(arr_length)
animal_array.length.times do |i|
  p "Enter animal name:"
  animal_name = gets.chomp
  if animal_name.empty?
    break
  else
    animal_array[i] = animal_name
  end
end

p "Original array: #{animal_array.join(",")}"
p "Sorting array: #{animal_array.sort.join(",")}"
p "Unique element count: #{animal_array.uniq.map { |x| "#{x}=>#{animal_array.count(x)}" }.join(",")}"
p "Array with unique element: #{animal_array.uniq.join(",")}"
p "Reverse array: #{animal_array.uniq.reverse.join(",")}"
