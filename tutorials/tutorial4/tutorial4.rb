animal_array = Array.new(10)
animal_array.length.times do |i|
  p "Enter animal name:"
  input = gets.chomp
  if input.empty?
    break
  else
    animal_array[i] = input
  end
end

p "Original array: #{animal_array.join(',')}"
p "Sorting array: #{animal_array.sort.join(',')}"
p "Unique element count: #{animal_array.uniq.map { |x| "#{x}=>#{animal_array.count(x)}" }.join(",")}" 
p "Array with unique element: #{animal_array.uniq.join(',')}"
p "Reverse array: #{animal_array.uniq.reverse.join(',')}"

