p "Create filename: "
file_name = gets.chomp.to_s
p "Create note: "
note = gets.chomp.to_s
p "Do You Want To Save? [y/n]: "
save = gets.chomp.to_s.downcase

if save === "y"
  File.open(file_name, "a+") do |file|
    file.puts(file_name) until File.exist?(file_name)
    file.write(note)
    file.close
  end
  p "Your filename: " + file_name
else
  p "Cancelled!"
end

begin
  p "Enter your filename to open"
  file_name = gets.chomp.to_s
  File.readlines(file_name).each do |file|
    p file
  end
rescue Errno::ENOENT
  p "File not found"
end
