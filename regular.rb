line = 'Perl is Perl and Python is Python'
if line =~ /Perl|Python/
  puts "scripting language for #{line}"
end

if line =~ /Pe+i*\s*/
  puts "scripting language for #{line}"
end

# replace Perl to Ruby
puts "#{line.sub(/Perl/, "Ruby")}"
puts line  # here the line value is not changed at above line
# replace all Perl to Ruby
puts "#{line.gsub(/Perl/, "Ruby")}"

time = '12:23:32'
puts "time is #{time}" if time =~ /\d\d:*\d\d:\d\d/








