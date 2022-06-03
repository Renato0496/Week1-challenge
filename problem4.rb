new_file_text = []

IO.foreach("strings.txt") do |line|
  a = line.gsub(/[ \t]+/," ")
  a.gsub!(/^[ \t]+/, "")
  if a[-2] && ![".", ":"].include?(a[-2])
    a.gsub!(/\n$/, " ")
  end
  new_file_text << a
end

File.open("solution.txt", "w") do |file|
  file.puts(new_file_text.join(""))
end

dis_count = 0
ing_count = 0

new_file_text.each do |str|
    str.scan(/\bdis/i) { |w| dis_count+= 1 }
    str.scan(/ing\b/i) { |w| ing_count+= 1 }
end

puts "Times when 'dis' is at the start of a word: #{dis_count}"
puts "Times when 'ing' is at the end of a word: #{ing_count}"


